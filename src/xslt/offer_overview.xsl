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
                <link rel="stylesheet" href="css/flatly.bootstrap.min.css" />
                <link rel="stylesheet" href="css/glyphicon.css" />
            </head>
            <body>

                <!-- NAVBAR -->
                <div class="navbar navbar-expand-lg fixed-top navbar-dark bg-primary">

                    <div class="container">
                        <a href="." class="navbar-brand">Unsere Tolle Sportanlage</a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarResponsive">

                            <ul class="nav navbar-nav ml-auto">
                                <li class="nav-item">
                                    <span class="nav-link">Design auswählen: </span>
                                </li>
                                <li class="nav-item">
                                    <span class="nav-link">
                                        Grosser Text
                                        <span class="glyphicon glyphicon-text-size"></span>
                                    </span>
                                </li>
                                <li class="nav-item">
                                    <span class="nav-link">
                                        Hoher Kontrast
                                        <span class="glyphicon glyphicon-text-background"></span>
                                    </span>
                                </li>
                            </ul>

                        </div>
                    </div>

                </div>

                <!-- CONTENT -->
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