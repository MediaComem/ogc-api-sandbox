### QGIS

Although it does not directly integrate this functionality into its user interface, QGIS allows you to connect to OGC API Coverages endpoints through the GDAL drivers it uses.

#### Open an OGC API - Coverages collection in QGIS

Follow the steps to add some collections from an OGC API - Coverages enpoint: 

* From the Layer menu, select `Add Layer` > `Add Raster layer`

!!! tip

Alternatively, you can use the following key combination: `Ctrl + Shift + R`

![OGC API Coverages connexion](oa-coverages-qgis.png)
*Connexion to an OGC API Coverages service via QGIS*

* For the `Source Type` choose `File`

* In the Raster dataset(s) field, provide the `collection_id` endpoint (e.g `https://maps.gnosis.earth/ogcapi/collections/SRTM_ViewFinderPanorama`)preceded by the following string: `OGCAPI`

* Click on the `Add` button

The following datasource should then been displayed in your QGIS client.

![GNOSIS OGC API Coverages service](SRTM_ViewFinderPanorama-QGIS.png)
*GNOSIS OGC API Coverages service*