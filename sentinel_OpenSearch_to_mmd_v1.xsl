<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns="http://www.met.no/schema/mmd"
    xmlns:dif="http://gcmd.gsfc.nasa.gov/Aboutus/xml/dif/"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:gco="http://www.isotc211.org/2005/gco"
    xmlns:gmd="http://www.isotc211.org/2005/gmd"
    xmlns:gml="http://www.opengis.net/gml"
    xmlns:mmd="http://www.met.no/schema/mmd"
    xmlns:mapping="http://www.met.no/schema/mmd/iso2mmd"
    >

    <!-- Following the MMD specification sheet v. 1.8 -->
    <xsl:output method="xml" indent="yes" />

    <xsl:template match="/entry">
        <xsl:element name="mmd:mmd">

            <!-- 3.1 - metadata_identifier and 3.22 - platform-->
            <xsl:apply-templates select="str[@name = 'identifier']"/>
            <!-- 3.2 - metadata_status -->
            <xsl:element name="mmd:metadata_status" >Active</xsl:element>
            <!-- 3.3 - collection -->
            <xsl:element name="mmd:collection" >NBS</xsl:element>
            <!-- 3.4 -->
            <xsl:apply-templates select="summary" />
            <!-- 3.5 - abstract-->
            <xsl:apply-templates select="str[@name = 'platformname']"/>
            <!-- 3.6 - related_datasets -->
            <!-- 3.7 - last_metadata_update -->
            <xsl:apply-templates select="date[@name = 'ingestiondate']" />

            <!-- 3.8 - dataset_language -->
            <xsl:element name="mmd:dataset_language" >en</xsl:element>
            <!-- 3.9 - dataset_production_status -->
            <xsl:element name="mmd:dataset_production_status">In Work</xsl:element>
            <!-- 3.10 - operational_status -->
            <xsl:element name="mmd:operational_status">operational</xsl:element>
            <!-- 3.11 - iso_topic_category (see 3.21 - instrument) -->
            <!-- 3.12 - temporal_extent -->
            <xsl:element name="mmd:temporal_extent">
              <xsl:apply-templates select="date[@name = 'beginposition']" />
              <xsl:apply-templates select="date[@name = 'endposition']" />
            </xsl:element>
            <!--  3.13 and 3.14 - geographic_extent - SOLVE Rectangle in PYTHON? Polygon OK!?-->
            <xsl:element name="mmd:geographic_extent">
              <!-- <xsl:apply-templates select="str[@name = 'gmlfootprint']" /> -->
            </xsl:element>
            <!-- 3.15 - location -->
            <!-- 3.16 - access_constraint -->
            <!-- 3.17 - use_constraint -->
            <!-- 3.18 - project -->
            <xsl:element name="mmd:project">
              <xsl:element name="mmd:short_name">NBS</xsl:element>
              <xsl:element name="mmd:long_name">Nasjonalt BakkeSegment</xsl:element>
            </xsl:element>
            <!-- 3.19 - activity_type -->
            <xsl:element name="mmd:activity_type">Space Borne Instrument</xsl:element>
            <!-- 3.20 - keywords  (see 3.21 - instrument) -->
            <xsl:variable name="i_id" select="str[@name = 'instrumentshortname']"/>
            <xsl:choose>
              <xsl:when test="$i_id = 'SAR-C SAR'" >
                <xsl:element name="mmd:iso_topic_category">climatologyMeteorologyAtmosphere</xsl:element>
                <xsl:element name="mmd:iso_topic_category">oceans</xsl:element>
                <xsl:element name="mmd:iso_topic_category">imageryBaseMapsEarthCover</xsl:element>
                <xsl:element name="mmd:keywords">
                  <xsl:attribute name="vocabulary">none</xsl:attribute>
                  <xsl:element name="mmd:keyword">Earth Science</xsl:element>
                  <xsl:element name="mmd:keyword">Atmosphere</xsl:element>
                  <xsl:element name="mmd:keyword">Atmospheric radiation</xsl:element>
                  <xsl:element name="mmd:keyword">Reflectance</xsl:element>
                </xsl:element>
              </xsl:when>
              <xsl:when test="$i_id = 'MSI'" >
                <xsl:element name="mmd:iso_topic_category">climatologyMeteorologyAtmosphere</xsl:element>
                <xsl:element name="mmd:iso_topic_category">oceans</xsl:element>
                <xsl:element name="mmd:iso_topic_category">imageryBaseMapsEarthCover</xsl:element>
                <xsl:element name="mmd:keywords">
                  <xsl:attribute name="vocabulary">none</xsl:attribute>
                  <xsl:element name="mmd:keyword">Earth Science</xsl:element>
                  <xsl:element name="mmd:keyword">Atmosphere</xsl:element>
                  <xsl:element name="mmd:keyword">Atmospheric radiation</xsl:element>
                  <xsl:element name="mmd:keyword">Reflectance</xsl:element>
                </xsl:element>
              </xsl:when>
              <xsl:when test="$i_id = 'OLCI'" >
                <xsl:element name="mmd:iso_topic_category">climatologyMeteorologyAtmosphere</xsl:element>
                <xsl:element name="mmd:iso_topic_category">oceans</xsl:element>
                <xsl:element name="mmd:iso_topic_category">inlandWaters</xsl:element>
                <xsl:element name="mmd:iso_topic_category">imageryBaseMapsEarthCover</xsl:element>
                <xsl:element name="mmd:keywords">
                  <xsl:attribute name="vocabulary">none</xsl:attribute>
                  <xsl:element name="mmd:keyword">Earth Science</xsl:element>
                  <xsl:element name="mmd:keyword">Atmosphere</xsl:element>
                  <xsl:element name="mmd:keyword">Atmospheric radiation</xsl:element>
                  <xsl:element name="mmd:keyword">Reflectance</xsl:element>
                </xsl:element>
              </xsl:when>
              <xsl:when test="$i_id = 'SLSTR'" >
                <xsl:element name="mmd:iso_topic_category">climatologyMeteorologyAtmosphere</xsl:element>
                <xsl:element name="mmd:iso_topic_category">oceans</xsl:element>
                <xsl:element name="mmd:iso_topic_category">imageryBaseMapsEarthCover</xsl:element>
                <xsl:element name="mmd:keywords">
                  <xsl:attribute name="vocabulary">none</xsl:attribute>
                  <xsl:element name="mmd:keyword">Earth Science</xsl:element>
                  <xsl:element name="mmd:keyword">Atmosphere</xsl:element>
                  <xsl:element name="mmd:keyword">Atmospheric radiation</xsl:element>
                  <xsl:element name="mmd:keyword">Reflectance</xsl:element>
                </xsl:element>
              </xsl:when>
              <xsl:when test="$i_id = 'SRAL'" >
                <xsl:element name="mmd:iso_topic_category">climatologyMeteorologyAtmosphere</xsl:element>
                <xsl:element name="mmd:iso_topic_category">oceans</xsl:element>
                <xsl:element name="mmd:iso_topic_category">elevation</xsl:element>
                <xsl:element name="mmd:iso_topic_category">imageryBaseMapsEarthCover</xsl:element>
                <xsl:element name="mmd:keywords">
                  <xsl:attribute name="vocabulary">none</xsl:attribute>
                  <xsl:element name="mmd:keyword">Earth Science</xsl:element>
                  <xsl:element name="mmd:keyword">Atmosphere</xsl:element>
                  <xsl:element name="mmd:keyword">Atmospheric radiation</xsl:element>
                  <xsl:element name="mmd:keyword">Reflectance</xsl:element>
                </xsl:element>
              </xsl:when>
            </xsl:choose>

            <!-- 3.21 - instrument -->
            <xsl:element name="mmd:instrument">
              <xsl:apply-templates select="str[@name = 'instrumentshortname']" />
              <xsl:apply-templates select="str[@name = 'instrumentname']" />
            </xsl:element>
            <!-- 3.22 - platform -->
            <xsl:apply-templates select="str[@name = 'platformidentifier']"/>
            <!-- 3.23 - related_information -->
            <!-- 3.24 - data_access -->
            <!-- 3.25 - personnel  -->
            <!-- 3.26 - data_center -->
            <xsl:element name="mmd:data_center" >
              <xsl:element name="mmd:data_center_name">
                <xsl:element name="mmd:short_name">METNO</xsl:element>
                <xsl:element name="mmd:long_name">Norwegian Meteorological Institute</xsl:element>
              </xsl:element>
              <xsl:element name="mmd:data_center_url">https://met.no</xsl:element>
              <xsl:element name="mmd:contact">
                <xsl:element name="mmd:role">Data center contact</xsl:element>
                <xsl:element name="mmd:name">Ole Dole</xsl:element>
                <xsl:element name="mmd:email">colhub@met.no</xsl:element>
                <xsl:element name="mmd:phone"/>
                <xsl:element name="mmd:fax"/>
              </xsl:element>
            </xsl:element>
            <!-- 3.27 - dataset_citation -->
            <!-- 3.28 - reference-->
            <!-- 3.31 - cloud_cover -->
            <xsl:apply-templates select="double[@name = 'cloudcoverpercentage']"/>
        </xsl:element>
    </xsl:template>

     <!-- TEMPLATES: -->

    <!--  metadata_identifier -->
    <xsl:template match="str[@name = 'identifier']">
      <xsl:variable name="id" select="."/>
      <xsl:element name="mmd:metadata_identifier">
        <xsl:value-of select="." />
      </xsl:element>
    </xsl:template>

    <!-- geographic_extent POLYGON -->
    <xsl:template match="str[@name = 'gmlfootprint']">
        <xsl:element name="mmd:polygon">
          <xsl:value-of select="." />
        </xsl:element>
    </xsl:template>

    <!-- abstract -->
    <xsl:template match="str[@name = 'platformname']">
      <xsl:variable name="p_id" select="."/>
        <xsl:choose>
        <xsl:when test="$p_id = 'Sentinel-1'">
          <xsl:element name="mmd:abstract" >
            <xsl:attribute name="xml:lang">en_GB</xsl:attribute>
            The SENTINEL-1 mission comprises a constellation of two polar-orbiting satellites, operating day and night performing C-band synthetic aperture radar imaging, enabling them to acquire imagery regardless of the weather.
          </xsl:element>
          <xsl:element name="mmd:related_information" >
            <xsl:element name="mmd:type">Technical information</xsl:element>
            <xsl:element name="mmd:resource">https://sentinel.esa.int/web/sentinel/missions/sentinel-1</xsl:element>
          </xsl:element>
        </xsl:when>
        <xsl:when test="$p_id = 'Sentinel-2'">
          <xsl:element name="mmd:abstract" >
            <xsl:attribute name="xml:lang">en_GB</xsl:attribute>
            Each of the satellites in the SENTINEL-2 mission carries a single payload: the Multi-Spectral Instrument (MSI).
          </xsl:element>
          <xsl:element name="mmd:related_information" >
            <xsl:element name="mmd:type">Technical information</xsl:element>
            <xsl:element name="mmd:resource">https://sentinel.esa.int/web/sentinel/missions/sentinel-2</xsl:element>
          </xsl:element>
        </xsl:when>
        <xsl:when test="$p_id = 'Sentinel-3'">
          <xsl:element name="mmd:abstract" >
            <xsl:attribute name="xml:lang">en_GB</xsl:attribute>
            The main objective of the SENTINEL-3 mission is to measure sea surface topography, sea and land surface temperature, and ocean and land surface colour with high accuracy and reliability to support ocean forecasting systems, environmental monitoring and climate monitoring.
          </xsl:element>
          <xsl:element name="mmd:related_information" >
            <xsl:element name="mmd:type">Technical information</xsl:element>
            <xsl:element name="mmd:resource">https://sentinel.esa.int/web/sentinel/missions/sentinel-3</xsl:element>
          </xsl:element>
        </xsl:when>
        <xsl:otherwise>
          <xsl:element name="mmd:abstract" >
            <xsl:attribute name="xml:lang">en_GB</xsl:attribute>
          </xsl:element>
          <xsl:element name="mmd:related_information" >
            <xsl:element name="mmd:type">Technical information</xsl:element>
            <xsl:element name="mmd:resource"></xsl:element>
          </xsl:element>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:template>


    <!-- instrument, iso_topic_category and keywords (two latter depend on first) -->
    <xsl:template match="str[starts-with(@name, 'instrument')]">
      <xsl:variable name="name" select="@name"/>
      <xsl:variable name="id" select="."/>
      <xsl:choose>
        <xsl:when test="$name = 'instrumentshortname'" >
          <xsl:element name="mmd:short_name">
            <xsl:value-of select="." />
          </xsl:element>
        </xsl:when>
        <xsl:when test="$name = 'instrumentname'" >
          <xsl:element name="mmd:long_name">
            <xsl:value-of select="." />
          </xsl:element>
        </xsl:when>
      </xsl:choose>
    </xsl:template>


    <xsl:template match="str[@name = 'instrumentname']">
      <xsl:element name="mmd:long_name">
        <xsl:value-of select="." />
      </xsl:element>
    </xsl:template>

    <!-- title -->
    <xsl:template match="summary">
        <xsl:element name="mmd:title">
            <xsl:attribute name="xml:lang">en_GB</xsl:attribute>
            <xsl:value-of select="." />
        </xsl:element>
    </xsl:template>

    <!-- temporal_extent -->
    <xsl:template match="date[@name = 'beginposition']">
      <xsl:variable name="name" select="@name"/>
      <xsl:variable name="date" select="."/>
        <xsl:element name="mmd:start_date">
          <xsl:value-of select="substring($date,1,10)"/>
          </xsl:element>
    </xsl:template>

    <xsl:template match="date[@name = 'endposition']">
      <xsl:variable name="name" select="@name"/>
      <xsl:variable name="date" select="."/>
          <xsl:element name="mmd:end_date">
            <xsl:value-of select="substring($date,1,10)"/>
          </xsl:element>
    </xsl:template>

    <!-- last_metadata_update -->
    <xsl:template match="date[@name = 'ingestiondate']">
      <xsl:variable name="date" select="."/>
      <xsl:element name="mmd:last_metadata_update">
          <xsl:value-of select="substring($date,1,10)"/>
      </xsl:element>
    </xsl:template>

    <!-- platform -->
    <xsl:template match="str[@name = 'platformidentifier']">
      <xsl:variable name="pid" select="."/>
      <xsl:element name="mmd:platform" >
      <xsl:choose>
        <xsl:when test="$pid = '2014-016A'">
          <xsl:element name="mmd:short_name">S1A</xsl:element>
          <xsl:element name="mmd:long_name">Sentinel-1A</xsl:element>
        </xsl:when>
        <xsl:when test="$pid = '2016-025A'">
          <xsl:element name="mmd:short_name">S1B</xsl:element>
          <xsl:element name="mmd:long_name">Sentinel-1B</xsl:element>
        </xsl:when>
        <xsl:when test="$pid = '2015-000A'">
          <xsl:element name="mmd:short_name">S2A</xsl:element>
          <xsl:element name="mmd:long_name">Sentinel-2A</xsl:element>
        </xsl:when>
        <xsl:when test="$pid = '2016-011A'">
          <xsl:element name="mmd:short_name">S3A</xsl:element>
          <xsl:element name="mmd:long_name">Sentinel-3A</xsl:element>
        </xsl:when>
      </xsl:choose>
      </xsl:element>
    </xsl:template>

    <!-- cloud_cover -->
    <xsl:template match="double[@name = 'cloudcoverpercentage']">
      <xsl:element name="mmd:cloud_cover">
        <xsl:element name="mmd:value">
          <xsl:attribute name="unit">%</xsl:attribute>
          <xsl:value-of select="."/>
        </xsl:element>
      </xsl:element>
    </xsl:template>

  </xsl:stylesheet>
