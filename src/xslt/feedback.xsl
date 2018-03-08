<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:param name="offerID"  />
	<xsl:variable name="selectedFeedback" select="document('../database/feedback.xml')//feedback[@offerID = $offerID]" />
	<xsl:variable name="selectedFunSum" select="$selectedFeedback/rating/@fun" />

	<!-- <xsl:variable name="fun" select="$selectedFeedback/rating[@fun]"/> -->



	<xsl:template match="/">
		<!--svg template - finde variables to change -->
			<!-- <fo:block><xsl:value-of select="$selectedFeedback/rating/@fun" /></fo:block> -->

			<svg width="15cm" height="10cm"
			 viewBox="0 0 1000 800" preserveAspectRatio="none"
			 xmlns="http://www.w3.org/2000/svg" version="1.1"
			 xmlns:xlink="http://www.w3.org/1999/xlink">
			 <style type="text/css">
				<![CDATA[
				line.radial {
					stroke: #333;
					stroke-width: 2pt;
				}
				polygon {
					stroke-width: 3pt;
				}
				svg {
					fill: none;
					stroke: #777;
					stroke-opacity: 1;
					stroke-width: 1pt;
				}
				text {
					fill: #000;
					font-family: times, serif;
					font-size: 14pt;
					font-weight: normal;
					stroke: none;
					text-anchor: middle;
				}
				.feedback { stroke: #37a; }
				.expenditure { stroke: #f73; }
				#values text { font-size: 10pt; }
				]]>
			</style>
			<defs>
				<g id="wedge" >
					<line class="radial" y2="300" />
					<line class="radial" x2="-268.47" y2="-155" />
					<line y1="-30" x2="-25.98" y2="-15" />
					<line y1="-60" x2="-51.96" y2="-30" />
					<line y1="-90" x2="-77.94" y2="-45" />
					<line y1="-120" x2="-103.92" y2="-60" />
					<line y1="-150" x2="-129.9" y2="-75" />
					<line y1="-180" x2="-155.88" y2="-90" />
					<line y1="-210" x2="-181.87" y2="-105" />
					<line y1="-240" x2="-207.85" y2="-120" />
					<line y1="-270" x2="-233.83" y2="-135" />
					<line y1="-300" x2="-259.81" y2="-150" />
				</g>
			</defs>

			<title>Spider Chart</title>
			<desc>This is a basic example of a spider chart. The graph depicts
				a comparison of departemental budgeting and expenditure.</desc>

			<g transform="translate(400 400)">
				<use xlink:href="#wedge" transform="rotate(0)" />
				<use xlink:href="#wedge" transform="rotate(60)" />
				<use xlink:href="#wedge" transform="rotate(120)" />
				<use xlink:href="#wedge" transform="rotate(180)" />
				<use xlink:href="#wedge" transform="rotate(240)" />
				<use xlink:href="#wedge" transform="rotate(300)" />



				<polygon class="feedback" points="0,-60 -50,-30.0 -50,30
					0,60 50,30 50,-30" />

				<!-- <polygon class="expenditure" points="0,-267 -150.69,-87 -85.74,49.5 -->
					<!-- 0,90 77.94,45 155.88,-90" /> -->

				<g id="labels">
					<text x="0" y="-320">Allgemein</text>
					<text x="-320" y="-170">Kursleitung</text>
					<text x="-320" y="155">Anstrenung</text>
					<!-- <text x="-320" y="170">Technology</text>-->
					<text x="0" y="340">Preis-Leistung</text>
					<!--<text x="0" y="355">Support</text>-->
					<text x="320" y="175">Schwierigkeit</text>
					<text x="310" y="-170">Spass</text>
				</g>

				<g id="values" transform="translate(-17 4)">
					<text x="0" y="0">0</text>
					<text x="0" y="-60">1</text>
					<text x="0" y="-120">2</text>
					<text x="0" y="-180">3</text>
					<text x="0" y="-240">4</text>
					<text x="0" y="-300">5</text>
				</g>
			</g>

			<!-- <g transform="translate(750 380)">
				<line class="feedback" x2="40"/>
				<text x="120" y="5">Allocated Budget</text>
				<line class="expenditure" x2="40" y1="50" y2="50"/>
				<text x="120" y="55">Actual Spending</text>
			</g> -->

		</svg>



	</xsl:template>

</xsl:stylesheet>
