<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

    <!-- set output to XHTML -->
    <xsl:output method="xml"
                doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
                indent="yes" />

    <!-- variables to access the database XML files -->
    <xsl:variable name="offers" select="document('../database/offer.xml')/offers"/>

    <!-- transformation -->
    <xsl:template match="/">
        <html>
            <head>
                <meta name="description" content="This is a the offer overview page." />
            </head>
            <body>
                <xsl:apply-templates select="$offers"/>
            </body>
        </html>
    </xsl:template>


    <!-- display all offers  -->
    <xsl:template match="offer">
        <p>
            <xsl:value-of select="title/text()" />
        </p>
    </xsl:template>


</xsl:stylesheet>