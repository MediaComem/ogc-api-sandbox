<?xml version="1.0" encoding="UTF-8"?><sld:StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:sld="http://www.opengis.net/sld" xmlns:gml="http://www.opengis.net/gml" xmlns:ogc="http://www.opengis.net/ogc" version="1.0.0">
  <sld:NamedLayer>
    <sld:Name>Default Styler</sld:Name>
    <sld:UserStyle>
      <sld:Name>Default Styler</sld:Name>
      <sld:FeatureTypeStyle>
        <sld:Rule>
          <sld:Title>Potential risk (dot density), high, mid</sld:Title>
          <sld:Abstract>Potential risk (dot density)</sld:Abstract>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>LCZ_PRIMARY</ogc:PropertyName>
              <ogc:Literal>10</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <sld:PolygonSymbolizer>
            <sld:Fill>
              <sld:GraphicFill>
                <sld:Graphic>
                  <sld:Mark>
                    <sld:WellKnownName>circle</sld:WellKnownName>
                    <sld:Fill>
                      <sld:CssParameter name="fill">#ffa500</sld:CssParameter>
                    </sld:Fill>
                  </sld:Mark>
                  <sld:Size>2</sld:Size>
                </sld:Graphic>
              </sld:GraphicFill>
            </sld:Fill>
            <sld:Stroke>
              <sld:CssParameter name="stroke">#ffa500</sld:CssParameter>
              <sld:CssParameter name="stroke-width">0.26</sld:CssParameter>
            </sld:Stroke>
            <sld:VendorOption name="random">grid</sld:VendorOption>
            <sld:VendorOption name="random-tile-size">100</sld:VendorOption>
            <sld:VendorOption name="random-symbol-count">n</sld:VendorOption>
          </sld:PolygonSymbolizer>
        </sld:Rule>
        <sld:Rule>
          <sld:Title>Potential risk (dot density), high</sld:Title>
          <sld:Abstract>Potential risk (dot density)</sld:Abstract>
          <ogc:Filter>
            <ogc:Or>
              <ogc:PropertyIsLessThanOrEqualTo>
                <ogc:PropertyName>LCZ_PRIMARY</ogc:PropertyName>
                <ogc:Literal>4</ogc:Literal>
              </ogc:PropertyIsLessThanOrEqualTo>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>LCZ_PRIMARY</ogc:PropertyName>
                <ogc:Literal>8</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>LCZ_PRIMARY</ogc:PropertyName>
                <ogc:Literal>105</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:Or>
          </ogc:Filter>
          <sld:PolygonSymbolizer>
            <sld:Fill>
              <sld:GraphicFill>
                <sld:Graphic>
                  <sld:Mark>
                    <sld:WellKnownName>circle</sld:WellKnownName>
                    <sld:Fill>
                      <sld:CssParameter name="fill">#a1251b</sld:CssParameter>
                    </sld:Fill>
                  </sld:Mark>
                  <sld:Size>2</sld:Size>
                </sld:Graphic>
              </sld:GraphicFill>
            </sld:Fill>
            <sld:Stroke>
              <sld:CssParameter name="stroke">#a1251b</sld:CssParameter>
              <sld:CssParameter name="stroke-width">0.26</sld:CssParameter>
            </sld:Stroke>
            <sld:VendorOption name="random">grid</sld:VendorOption>
            <sld:VendorOption name="random-tile-size">100</sld:VendorOption>
            <sld:VendorOption name="random-symbol-count">n</sld:VendorOption>
          </sld:PolygonSymbolizer>
        </sld:Rule>
        <sld:Rule>
          <sld:Title>Potential risk (dot density), mid</sld:Title>
          <sld:Abstract>Potential risk (dot density)</sld:Abstract>
          <ogc:Filter>
            <ogc:Or>
              <ogc:PropertyIsBetween>
                <ogc:PropertyName>LCZ_PRIMARY</ogc:PropertyName>
                <ogc:LowerBoundary>
                  <ogc:Literal>5</ogc:Literal>
                </ogc:LowerBoundary>
                <ogc:UpperBoundary>
                  <ogc:Literal>7</ogc:Literal>
                </ogc:UpperBoundary>
              </ogc:PropertyIsBetween>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>LCZ_PRIMARY</ogc:PropertyName>
                <ogc:Literal>9</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:Or>
          </ogc:Filter>
          <sld:PolygonSymbolizer>
            <sld:Fill>
              <sld:GraphicFill>
                <sld:Graphic>
                  <sld:Mark>
                    <sld:WellKnownName>circle</sld:WellKnownName>
                    <sld:Fill>
                      <sld:CssParameter name="fill">#ffa500</sld:CssParameter>
                    </sld:Fill>
                  </sld:Mark>
                  <sld:Size>2</sld:Size>
                </sld:Graphic>
              </sld:GraphicFill>
            </sld:Fill>
            <sld:Stroke>
              <sld:CssParameter name="stroke">#ffa500</sld:CssParameter>
              <sld:CssParameter name="stroke-width">0.26</sld:CssParameter>
            </sld:Stroke>
            <sld:VendorOption name="random">grid</sld:VendorOption>
            <sld:VendorOption name="random-tile-size">100</sld:VendorOption>
            <sld:VendorOption name="random-symbol-count">n</sld:VendorOption>
          </sld:PolygonSymbolizer>
        </sld:Rule>
        <sld:Rule>
          <sld:Title>Potential risk (dot density), low</sld:Title>
          <sld:Abstract>Potential risk (dot density)</sld:Abstract>
          <ogc:Filter>
            <ogc:And>
              <ogc:Or>
                <ogc:PropertyIsNull>
                  <ogc:PropertyName>LCZ_PRIMARY</ogc:PropertyName>
                </ogc:PropertyIsNull>
                <ogc:PropertyIsLessThan>
                  <ogc:PropertyName>LCZ_PRIMARY</ogc:PropertyName>
                  <ogc:Literal>5</ogc:Literal>
                </ogc:PropertyIsLessThan>
                <ogc:PropertyIsGreaterThan>
                  <ogc:PropertyName>LCZ_PRIMARY</ogc:PropertyName>
                  <ogc:Literal>7</ogc:Literal>
                </ogc:PropertyIsGreaterThan>
              </ogc:Or>
              <ogc:Or>
                <ogc:PropertyIsBetween>
                  <ogc:PropertyName>LCZ_PRIMARY</ogc:PropertyName>
                  <ogc:LowerBoundary>
                    <ogc:Literal>101</ogc:Literal>
                  </ogc:LowerBoundary>
                  <ogc:UpperBoundary>
                    <ogc:Literal>104</ogc:Literal>
                  </ogc:UpperBoundary>
                </ogc:PropertyIsBetween>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>LCZ_PRIMARY</ogc:PropertyName>
                  <ogc:Literal>107</ogc:Literal>
                </ogc:PropertyIsEqualTo>
              </ogc:Or>
            </ogc:And>
          </ogc:Filter>
          <sld:PolygonSymbolizer>
            <sld:Fill>
              <sld:GraphicFill>
                <sld:Graphic>
                  <sld:Mark>
                    <sld:WellKnownName>circle</sld:WellKnownName>
                    <sld:Fill>
                      <sld:CssParameter name="fill">#0080ff</sld:CssParameter>
                    </sld:Fill>
                  </sld:Mark>
                  <sld:Size>2</sld:Size>
                </sld:Graphic>
              </sld:GraphicFill>
            </sld:Fill>
            <sld:Stroke>
              <sld:CssParameter name="stroke">#0080ff</sld:CssParameter>
              <sld:CssParameter name="stroke-width">0.26</sld:CssParameter>
            </sld:Stroke>
            <sld:VendorOption name="random">grid</sld:VendorOption>
            <sld:VendorOption name="random-tile-size">100</sld:VendorOption>
            <sld:VendorOption name="random-symbol-count">n</sld:VendorOption>
          </sld:PolygonSymbolizer>
        </sld:Rule>
        <sld:Rule>
          <sld:Title>Potential risk (dot density)</sld:Title>
          <sld:Abstract>Potential risk (dot density)</sld:Abstract>
          <ogc:Filter>
            <ogc:And>
              <ogc:Or>
                <ogc:PropertyIsNull>
                  <ogc:PropertyName>LCZ_PRIMARY</ogc:PropertyName>
                </ogc:PropertyIsNull>
                <ogc:PropertyIsLessThan>
                  <ogc:PropertyName>LCZ_PRIMARY</ogc:PropertyName>
                  <ogc:Literal>5</ogc:Literal>
                </ogc:PropertyIsLessThan>
                <ogc:PropertyIsGreaterThan>
                  <ogc:PropertyName>LCZ_PRIMARY</ogc:PropertyName>
                  <ogc:Literal>7</ogc:Literal>
                </ogc:PropertyIsGreaterThan>
              </ogc:Or>
              <ogc:Or>
                <ogc:PropertyIsNull>
                  <ogc:PropertyName>LCZ_PRIMARY</ogc:PropertyName>
                </ogc:PropertyIsNull>
                <ogc:PropertyIsLessThan>
                  <ogc:PropertyName>LCZ_PRIMARY</ogc:PropertyName>
                  <ogc:Literal>101</ogc:Literal>
                </ogc:PropertyIsLessThan>
                <ogc:PropertyIsGreaterThan>
                  <ogc:PropertyName>LCZ_PRIMARY</ogc:PropertyName>
                  <ogc:Literal>104</ogc:Literal>
                </ogc:PropertyIsGreaterThan>
              </ogc:Or>
              <ogc:PropertyIsGreaterThan>
                <ogc:PropertyName>LCZ_PRIMARY</ogc:PropertyName>
                <ogc:Literal>4</ogc:Literal>
              </ogc:PropertyIsGreaterThan>
              <ogc:PropertyIsNotEqualTo>
                <ogc:PropertyName>LCZ_PRIMARY</ogc:PropertyName>
                <ogc:Literal>8</ogc:Literal>
              </ogc:PropertyIsNotEqualTo>
              <ogc:PropertyIsNotEqualTo>
                <ogc:PropertyName>LCZ_PRIMARY</ogc:PropertyName>
                <ogc:Literal>9</ogc:Literal>
              </ogc:PropertyIsNotEqualTo>
              <ogc:PropertyIsNotEqualTo>
                <ogc:PropertyName>LCZ_PRIMARY</ogc:PropertyName>
                <ogc:Literal>10</ogc:Literal>
              </ogc:PropertyIsNotEqualTo>
              <ogc:PropertyIsNotEqualTo>
                <ogc:PropertyName>LCZ_PRIMARY</ogc:PropertyName>
                <ogc:Literal>105</ogc:Literal>
              </ogc:PropertyIsNotEqualTo>
              <ogc:PropertyIsNotEqualTo>
                <ogc:PropertyName>LCZ_PRIMARY</ogc:PropertyName>
                <ogc:Literal>107</ogc:Literal>
              </ogc:PropertyIsNotEqualTo>
            </ogc:And>
          </ogc:Filter>
          <sld:PolygonSymbolizer>
            <sld:Fill>
              <sld:GraphicFill>
                <sld:Graphic>
                  <sld:Mark>
                    <sld:WellKnownName>circle</sld:WellKnownName>
                  </sld:Mark>
                  <sld:Size>2</sld:Size>
                </sld:Graphic>
              </sld:GraphicFill>
            </sld:Fill>
            <sld:VendorOption name="random">grid</sld:VendorOption>
            <sld:VendorOption name="random-tile-size">100</sld:VendorOption>
            <sld:VendorOption name="random-symbol-count">n</sld:VendorOption>
          </sld:PolygonSymbolizer>
        </sld:Rule>
        <sld:VendorOption name="ruleEvaluation">first</sld:VendorOption>
      </sld:FeatureTypeStyle>
    </sld:UserStyle>
  </sld:NamedLayer>
</sld:StyledLayerDescriptor>

