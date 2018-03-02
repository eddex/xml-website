<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

    <xsl:param name="offerID"  />
    <xsl:variable name="chosenCourses" select="document('../database/offer.xml')//offer[@id = $offerID]//course" />

    <!-- set output to XHTML -->
    <xsl:output method="xml"
                doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
                indent="yes" />

    <!-- transformation -->
    <xsl:template match="/">
        <html>
            <head>
                <!-- CSS FRAMEWORKS -->
                <link rel="stylesheet" href="css/lib/flatly.bootstrap.min.css" />
                <link rel="stylesheet" href="css/lib/flatly.custom.min.css" />
                <link rel="stylesheet" href="css/lib/glyphicon.css" />
                <!-- ACCESSIBILITY STYLES -->
                <link id="style" rel="stylesheet" href="css/accessibility/none.css" />
            </head>
            <body>
                <hr width="100%" />
                <xsl:apply-templates select="$chosenCourses"/>
            </body>
        </html>
    </xsl:template>


    <!-- display all offers  -->
    <xsl:template match="//course">
        <div class="row">
            <div class="col-sm-3" align="left">
                <xsl:value-of select="../title/text()" /> - <xsl:value-of select="@courseId" />
            </div>
            <div class="col-sm-3" align="center">
                <xsl:value-of select="@date" /><xsl:text>,     </xsl:text>
                <xsl:value-of select="@time" /> Uhr
            </div>
            <div class="col-sm-3" align="center">
                <xsl:value-of select="../price" /> CHF
            </div>
            <div class="col-sm-3" align="right">
                <button type="button" class="btn btn-default btn-sm addreservationbutton">
                    <xsl:attribute name="data-courseid">
                        <xsl:value-of select="@courseId" />
                    </xsl:attribute>
                    <xsl:attribute name="data-offerid">
                        <xsl:value-of select="../@id" />
                    </xsl:attribute>
                    Reservieren
                </button>
            </div>
        </div>
        <hr width="100%" />
    </xsl:template>


</xsl:stylesheet>