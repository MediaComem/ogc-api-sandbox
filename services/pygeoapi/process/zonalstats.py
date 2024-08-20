#https://pcjericks.github.io/py-gdalogr-cookbook/raster_layers.html#calculate-zonal-statistics
#https://github.com/ECCC-MSC/msc-pygeoapi/blob/master/msc_pygeoapi/process/weather/extract_raster.py

import logging

import gdal, ogr, osr, numpy
from pygeoapi.process.base import BaseProcessor, ProcessorExecuteError

LOGGER = logging.getLogger(__name__)

#: Process metadata and description
PROCESS_METADATA = {
    'version': '1.0.0',
    'id': 'zonal-stats',
    'title': {
        'en': 'Zonal Statistics',
        'fr': 'Statistiques Zonales'
    },
    'description': {
        'en': 'An example of a zonal stat process.',
        'fr': 'Un exemple de processus de statistiques zonales.',
    },
    'keywords': ['zonal statistics', 'ndwi'],
    'links': [{
        'type': 'text/html',
        'rel': 'about',
        'title': 'information',
        'href': 'https://example.org/process',
        'hreflang': 'en-US'
    }],
    'inputs': {
        'input_value_raster': {
            'title': 'Raster',
            'description': 'Raster file as values',
            'schema': {
                'type': 'string'
            },
            'minOccurs': 1,
            'maxOccurs': 1,
            'keywords': ['raster', 'value']
        },
        'input_zone_polygon': {
            'title': 'Zones',
            'description': 'Shape file as zones',
            'schema': {
                'type': 'string'
            },
            'minOccurs': 1,
            'maxOccurs': 1,
            'keywords': ['vector','zones']
        }
    },
    'outputs': {
        'statsValue': {
            'title': 'Zonal Statistics Ouputs',
            'description': 'Statistical summary: Average, Mean, Medain, Standard Deviation, Variance',
            'schema': {
                'type': 'object',
                'contentMediaType': 'application/json'
            },
            'output': {
            'formats': [{
                'mimeType': 'application/json'
            }]
        }
        }
    },
}

def zonal_stats(feat, input_zone_polygon, input_value_raster):
    # Open data
    raster = gdal.Open(input_value_raster)
    shp = ogr.Open(input_zone_polygon)
    lyr = shp.GetLayer()

    # Get raster georeference info
    transform = raster.GetGeoTransform()
    xOrigin = transform[0]
    yOrigin = transform[3]
    pixelWidth = transform[1]
    pixelHeight = transform[5]

    # Reproject vector geometry to same projection as raster
    sourceSR = lyr.GetSpatialRef()
    targetSR = osr.SpatialReference()
    targetSR.ImportFromWkt(raster.GetProjectionRef())
    coordTrans = osr.CoordinateTransformation(sourceSR,targetSR)
    feat = lyr.GetNextFeature()
    geom = feat.GetGeometryRef()
    geom.Transform(coordTrans)

    # Get extent of feat
    geom = feat.GetGeometryRef()
    if (geom.GetGeometryName() == 'MULTIPOLYGON'):
        count = 0
        pointsX = []; pointsY = []
        for polygon in geom:
            geomInner = geom.GetGeometryRef(count)
            ring = geomInner.GetGeometryRef(0)
            numpoints = ring.GetPointCount()
            for p in range(numpoints):
                    lon, lat, z = ring.GetPoint(p)
                    pointsX.append(lon)
                    pointsY.append(lat)
            count += 1
    elif (geom.GetGeometryName() == 'POLYGON'):
        ring = geom.GetGeometryRef(0)
        numpoints = ring.GetPointCount()
        pointsX = []; pointsY = []
        for p in range(numpoints):
                lon, lat, z = ring.GetPoint(p)
                pointsX.append(lon)
                pointsY.append(lat)

    else:
        msg = "ERROR: Geometry needs to be either Polygon or Multipolygon"
        LOGGER.error(msg)
        raise ProcessorExecuteError(msg)

    xmin = min(pointsX)
    xmax = max(pointsX)
    ymin = min(pointsY)
    ymax = max(pointsY)

    # Specify offset and rows and columns to read
    xoff = int((xmin - xOrigin)/pixelWidth)
    yoff = int((yOrigin - ymax)/pixelWidth)
    xcount = int((xmax - xmin)/pixelWidth)+1
    ycount = int((ymax - ymin)/pixelWidth)+1

    # Create memory target raster
    target_ds = gdal.GetDriverByName('MEM').Create('', xcount, ycount, 1, gdal.GDT_Byte)
    target_ds.SetGeoTransform((
        xmin, pixelWidth, 0,
        ymax, 0, pixelHeight,
    ))

    # Create for target raster the same projection as for the value raster
    raster_srs = osr.SpatialReference()
    raster_srs.ImportFromWkt(raster.GetProjectionRef())
    target_ds.SetProjection(raster_srs.ExportToWkt())

    # Rasterize zone polygon to raster
    gdal.RasterizeLayer(target_ds, [1], lyr, burn_values=[1])

    # Read raster as arrays
    banddataraster = raster.GetRasterBand(1)
    dataraster = banddataraster.ReadAsArray(xoff, yoff, xcount, ycount).astype(numpy.float)

    bandmask = target_ds.GetRasterBand(1)
    datamask = bandmask.ReadAsArray(0, 0, xcount, ycount).astype(numpy.float)

    # Mask zone of raster
    zoneraster = numpy.ma.masked_array(dataraster, numpy.logical_not(datamask))

    # Calculate statistics of zonal raster
    return numpy.average(zoneraster),numpy.mean(zoneraster),numpy.median(zoneraster),numpy.std(zoneraster),numpy.var(zoneraster)


def loop_zonal_stats(input_zone_polygon, input_value_raster):

    shp = ogr.Open(input_zone_polygon)
    lyr = shp.GetLayer()
    featList = range(lyr.GetFeatureCount())
    statDict = {}

    for FID in featList:
        feat = lyr.GetFeature(FID)
        meanValue = zonal_stats(feat, input_zone_polygon, input_value_raster)
        statDict[FID] = meanValue
    return statDict

def main(input_zone_polygon, input_value_raster):
    return loop_zonal_stats(input_zone_polygon, input_value_raster)


class ZonalStatsProcessor(BaseProcessor):
    """Zonal Stats Processor"""

    def __init__(self, processor_def):
        """
        Initialize object
        :param processor_def: provider definition
        :returns: pygeoapi.process.ZonalStats.ZonalStatsProcessor
        """

        super().__init__(processor_def, PROCESS_METADATA) #BaseProcessor.__init__(self, provider_def, PROCESS_METADATA)

    def execute(self, data):
        mimetype = 'application/json'
        input_value_raster = data.get('input_value_raster')
        input_zone_polygon = data.get('input_zone_polygon')

        if None in [input_value_raster, input_zone_polygon]:
            raise ProcessorExecuteError('Missing inputs')

        value = main(input_zone_polygon, input_value_raster)

        outputs = {
            'id': 'echo',
            'value': value
        }

        return mimetype, outputs

    def __repr__(self):
        return '<ZonalStatsProcessor> {}'.format(self.name)
