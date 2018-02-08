<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <xsl:template match="/">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="dvd_list" page-height="29.7cm" page-width="21cm" margin-top="1cm" margin-bottom="2cm" margin-left="2.5cm" margin-right="2.5cm">
                    <fo:region-body margin-top="1cm"/>
                    <fo:region-before extent="2cm"/>
                    <fo:region-after extent="3cm"/>
                </fo:simple-page-master>
            </fo:layout-master-set>

            <fo:page-sequence master-reference="dvd_list">
                <!-- static content, such as footer(region-before) and header(region-after) -->
                <fo:static-content flow-name="xsl-region-before">
                    <fo:block text-align="center" font-size="8pt">
                        Region Before
                    </fo:block>
                </fo:static-content>
                <fo:static-content flow-name="xsl-region-after">
                    <fo:block text-align="center" font-size="8pt">
                        Region After
                    </fo:block>
                </fo:static-content>
                <fo:flow flow-name="xsl-region-body">
                    <fo:block font-size="26pt" font-family="sans-serif" line-height="24pt" space-after.optimum="20pt" background-color="black" color="white" text-align="center" padding-top="5pt" padding-bottom="5pt">
                        Reservierungs Bestätigung
                    </fo:block>
                    <xsl:apply-templates />
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>

    <xsl:template match="//Reservation">
        <fo:block-container>
            <fo:block min-width="1000" max-width="1000" background-color="red">
                <fo:block>Angebot: <xsl:value-of select="@offerId" /></fo:block>
                <fo:block>Kurs: <xsl:value-of select="@courseId" /></fo:block>
            </fo:block>
        </fo:block-container>
    </xsl:template>
</xsl:stylesheet>
