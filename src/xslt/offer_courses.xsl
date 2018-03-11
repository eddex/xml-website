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
        <hr width="100%" />
        <xsl:apply-templates select="$chosenCourses"/>
    </xsl:template>

    <!-- display all offers  -->
    <xsl:template match="//course">
        <div class="row">
            <div class="col-lg-3" align="left">
                <span>
                    <xsl:value-of select="../title/text()" /> - <xsl:value-of select="@courseId" />
                </span>
            </div>
            <div class="col-lg-4" align="center">
                <span>
                    <xsl:value-of select="@date" /><xsl:text>,     </xsl:text>
                    <xsl:value-of select="@time" /> Uhr
                </span>
            </div>
            <div class="col-lg-2" align="center">
                <span>
                    <xsl:value-of select="../price" /> CHF
                </span>
            </div>
            <div class="col-lg-3" align="right">
                <button type="button" class="btn btn-primary btn-sm addreservationbutton">
                    <xsl:attribute name="data-courseid">
                        <xsl:value-of select="@courseId" />
                    </xsl:attribute>
                    <xsl:attribute name="data-offerid">
                        <xsl:value-of select="../@id" />
                    </xsl:attribute>
                    <xsl:attribute name="data-title">
                        <xsl:value-of select="../title/text()" /><xsl:text>   </xsl:text>
                        <xsl:value-of select="@date" /><xsl:text>,  </xsl:text>
                        <xsl:value-of select="@time" /> Uhr
                    </xsl:attribute>
                    Reservieren
                </button>
            </div>
        </div>
        <hr width="100%" />
    </xsl:template>

</xsl:stylesheet>