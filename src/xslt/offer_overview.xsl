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
                <link rel="stylesheet" href="css/lib/flatly.bootstrap.min.css" />
                <link rel="stylesheet" href="css/lib/flatly.custom.min.css" />
                <link rel="stylesheet" href="css/lib/glyphicon.css" />
                <!-- ACCESSIBILITY STYLES -->
                <link id="style" rel="stylesheet" href="css/accessibility/none.css" />
				<script type="text/javascript" src="js/audio.js"> </script>
            </head>
            <body onload="restoreStyle('big.font.size');getAudio()">

                <!-- NAVBAR -->
                <div class="navbar navbar-expand-lg fixed-top navbar-dark bg-primary">
                    <div class="container">
                        <a href="." class="navbar-brand">Fiescher Sportzentrum</a>
                    </div>
                </div>

                <!-- CONTENT -->
                <div class="container">
                    <!-- HEAD -->
                    <div class="page-header" id="banner">
                        <div class="row">
                            <div class="col-lg-8" onmouseover="playWelcome();">
                                <h1>Willkommen</h1>
                                <p class="lead">
                                    In unserem Sportzentrum können sie tolle sachen machen.
                                </p>
                            </div>
                        </div>
                        <!-- PAGE DESIGN CHOICE -->
                        <div class="bs-docs-section clearfix" >
                            <div class="row">
                                <div class="col-lg-12" onmouseover="playDesign();">
                                    <h3>Design</h3>
                                    <p class="lead">
                                        Wählen sie ein Design für die Webseite, welches ihren Ansprüchen entspricht.
                                    </p>
                                </div>
                                <div class="col-lg-3" onmouseover="playGroText();">
                                    <p class="bs-component">
                                        <button type="button" class="btn btn-primary btn-lg btn-block" onclick="changeToStyle('big.font.size')">
                                            Grosser Text
                                            <span class="glyphicon glyphicon-text-size"> </span>
                                        </button>
                                    </p>
                                </div>
                                <div class="col-lg-3" onmouseover="playHohKontrast();">
                                    <p class="bs-component">
                                        <button type="button" class="btn btn-primary btn-lg btn-block"  onclick="changeToStyle('high.contrast')">
                                            Hoher Kontrast
                                            <span class="glyphicon glyphicon-text-background"> </span>
                                        </button>
                                    </p>
                                </div>
                                <div class="col-lg-3" onmouseover="playHohKonGroText();">
                                    <p class="bs-component">
                                        <button type="button" class="btn btn-primary btn-lg btn-block" onclick="changeToStyle('both')">
                                            Beides
                                            <span class="glyphicon glyphicon-text-size"> </span>
                                            <span class="glyphicon glyphicon-text-background"> </span>
                                        </button>
                                    </p>
                                </div>
                                <div class="col-lg-3" onmouseover="playStandard();">
                                    <p class="bs-component">
                                        <button type="button" class="btn btn-primary btn-lg btn-block" onclick="changeToStyle('none')">
                                            Nichts
                                            <span class="glyphicon glyphicon-sunglasses"> </span>
                                        </button>
                                    </p>
                                </div>
								<div class="col-lg-3">
								<p class="bs-component">
									<button id="audioButton" type="button" class="btn btn-primary btn-lg btn-block" onclick="changeAudio()">
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
				
				<audio id="welcomeClip">
					<source src="audio/Willkommen.mp3" />
				</audio>
				<audio id="designClip">
					<source src="audio/Design.mp3" />
				</audio>
				<audio id="groTextClip">
					<source src="audio/GroText.mp3" />
				</audio>
				<audio id="hohKontrastClip">
					<source src="audio/HohKontrast.mp3" />
				</audio>
				<audio id="hohKonGroTextClip">
					<source src="audio/HohKonGroText.mp3" />
				</audio>
				<audio id="standardClip">
					<source src="audio/Standard.mp3" />
				</audio>
				<audio id="basketballClip">
					<source src="audio/Basketball.mp3" />
				</audio>
				<audio id="handballClip">
					<source src="audio/Handball.mp3" />
				</audio>
				<audio id="treckingClip">
					<source src="audio/Trecking.mp3" />
				</audio>
				<audio id="joggingClip">
					<source src="audio/Jogging.mp3" />
				</audio>
				<audio id="saunaClip">
					<source src="audio/Sauna.mp3" />
				</audio>
				<audio id="wellnessClip">
					<source src="audio/Wellness.mp3" />
				</audio>
				<audio id="vitaClip">
					<source src="audio/Vita.mp3" />
				</audio>
				<audio id="swimmingClip">
					<source src="audio/Swimming.mp3" />
				</audio>
				<audio id="spinningClip">
					<source src="audio/Spinning.mp3" />
				</audio>
				<audio id="inlineClip">
					<source src="audio/Inline.mp3" />
				</audio>
            </body>
        </html>
    </xsl:template>

    <!-- display all offers  -->
    <xsl:template match="offer">
        <div class="col-lg-6">
            <xsl:element name="a">
                <xsl:attribute name="href">
                    details.php?id=<xsl:value-of select="@id"/>
                </xsl:attribute>
                <xsl:attribute name="style">
                    color: black;
                    text-decoration: none;
                </xsl:attribute>
				<xsl:attribute name="onmouseover">
					play<xsl:value-of select="translate(title/text(), '-', '')" />();
				</xsl:attribute>
                <div class="bs-component">
                    <div class="card mb-3">
						
                        <xsl:element name="img">
                            <xsl:attribute name="style">
                                min-height: 200px; width: 100%; display: block;
                            </xsl:attribute>
                            <xsl:attribute name="src">
                                <xsl:value-of select="image"/>
                            </xsl:attribute>
                        </xsl:element>
                        <h3 class="card-header"><xsl:value-of select="title/text()" /></h3>
                        <div class="card-body" >
                            <h5 class="card-title"><xsl:value-of select="description/text()" /></h5>
                            <button type="button" class="btn btn-info col-lg-12">
                                Details und Registrierung
                                <span class="glyphicon glyphicon-circle-arrow-right"> </span>
                            </button>
                        </div>
                    </div>
                </div>
            </xsl:element>
        </div>
    </xsl:template>
    
</xsl:stylesheet>