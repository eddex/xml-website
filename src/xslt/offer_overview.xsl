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
                <link rel="stylesheet" href="css/flatly.custom.min.css" />
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
                <div class="container">

                    <div class="page-header" id="banner">
                        <div class="row">
                            <div class="col-lg-8 col-md-7 col-sm-6">
                                <h1>Willkommen</h1>
                                <p class="lead">
                                    In unserem Sportzentrum können sie tolle sachen machen.
                                    Soluta quas sit sint voluptatem ratione qui et dolore.
                                    Eligendi quidem aspernatur et et consectetur.
                                    Sunt eos necessitatibus mollitia culpa aut distinctio.
                                    Hic quasi rerum eos repellat quia aliquam et.
                                    Eius sit necessitatibus est. Praesentium qui rem deserunt delectus rem et.
                                </p>
                            </div>
                        </div>
                        <div class="row">

                            <xsl:apply-templates select="$offers"/>

                        </div>
                    </div>

                </div>
            </body>
        </html>
    </xsl:template>


    <!-- display all offers  -->
    <xsl:template match="offer">
        <div class="col-lg-4">
            <div class="bs-component">
                <div class="card mb-3">
                    <img style="height: 200px; width: 100%; display: block;" src="" alt="Card image" />
                    <h3 class="card-header"><xsl:value-of select="title/text()" /></h3>
                    <div class="card-body">
                        <h5 class="card-title"><xsl:value-of select="description/text()" /></h5>
                    </div>
                </div>
            </div>
        </div>
    </xsl:template>


</xsl:stylesheet>