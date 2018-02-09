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
                <meta name="description" content="Hier finden Sie eine Übersicht aller Angebote." />
                <!-- CSS FRAMEWORKS -->
                <link rel="stylesheet" href="css/flatly.bootstrap.min.css" />
                <link rel="stylesheet" href="css/flatly.custom.min.css" />
                <link rel="stylesheet" href="css/glyphicon.css" />
                <!-- ACCESSIBILITY STYLES -->
                <link id="style" rel="stylesheet" href="css/accessibility/none.css" />
            </head>
            <body onload="restoreStyle('big.font.size')">

                <!-- NAVBAR -->
                <div class="navbar navbar-expand-lg fixed-top navbar-dark bg-primary">

                    <div class="container">
                        <a href="." class="navbar-brand">Unsere Tolle Sportanlage</a>
                    </div>
                </div>

                <!-- CONTENT -->
                <div class="container">
                    <!-- HEAD -->
                    <div class="page-header" id="banner">
                        <div class="row">
                            <div class="col-lg-8">
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
                        <!-- PAGE DESIGN CHOICE -->
                        <div class="bs-docs-section clearfix">
                            <div class="row">
                                <div class="col-lg-12">
                                    <h3>Design</h3>
                                    <p class="lead">
                                        Wählen sie ein Design für die Webseite, welches ihren Ansprüchen entspricht.
                                    </p>
                                </div>
                                <div class="col-lg-3">
                                    <p class="bs-component">
                                        <button type="button" class="btn btn-primary btn-lg btn-block" onclick="changeToStyle('big.font.size')">
                                            Grosser Text
                                            <span class="glyphicon glyphicon-text-size"> </span>
                                        </button>
                                    </p>
                                </div>
                                <div class="col-lg-3">
                                    <p class="bs-component">
                                        <button type="button" class="btn btn-primary btn-lg btn-block"  onclick="changeToStyle('high.contrast')">
                                            Hoher Kontrast
                                            <span class="glyphicon glyphicon-text-background"> </span>
                                        </button>
                                    </p>
                                </div>
                                <div class="col-lg-3">
                                    <p class="bs-component">
                                        <button type="button" class="btn btn-primary btn-lg btn-block" onclick="changeToStyle('both')">
                                            Beides
                                            <span class="glyphicon glyphicon-text-size"> </span>
                                            <span class="glyphicon glyphicon-text-background"> </span>
                                        </button>
                                    </p>
                                </div>
                                <div class="col-lg-3">
                                    <p class="bs-component">
                                        <button type="button" class="btn btn-primary btn-lg btn-block" onclick="changeToStyle('none')">
                                            Nichts
                                            <span class="glyphicon glyphicon-sunglasses"> </span>
                                        </button>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <!-- OFFERS -->
                        <div class="bs-docs-section clearfix">
                            <div class="row">
                                <div class="col-lg-12">
                                    <h3>Angebot</h3>
                                </div>
                                <xsl:apply-templates select="$offers"/>
                            </div>
                        </div>

                    </div>

                </div>
                <script type="text/javascript" src="js/style.js"> </script>
            </body>
        </html>
    </xsl:template>


    <!-- display all offers  -->
    <xsl:template match="offer">
        <div class="col-lg-6">
            <div class="bs-component">
                <div class="card mb-3">
                    <img style="min-height: 200px; width: 100%; display: block;"
                         src="https://image.shutterstock.com/z/stock-photo-businessman-ready-to-commit-suicide-93915967.jpg"
                         alt="Card image" />
                    <h3 class="card-header"><xsl:value-of select="title/text()" /></h3>
                    <div class="card-body">
                        <h5 class="card-title"><xsl:value-of select="description/text()" /></h5>
                    </div>
                </div>
            </div>
        </div>
    </xsl:template>


</xsl:stylesheet>