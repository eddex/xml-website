<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <xsl:param name="offerID"  />
    <xsl:param name="courseID"  />
    <xsl:variable name="selectedOffer" select="document('../database/offer.xml')//*[@id = $offerID]" />
    <xsl:variable name="selectedCourse" select="$selectedOffer//*[@courseId = $courseID]" />

    <xsl:template match="/">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="masterpage" page-height="29.7cm" page-width="21cm" margin="2" >
                    <fo:region-body margin="20" background-color="#343434"/>
                    <fo:region-before extent="0.73cm" background-color="#353839" />
                    <fo:region-after extent="0.73cm" background-color="#353839" />
                    <fo:region-start extent="0.73cm" background-color="#353839" />
                    <fo:region-end  extent="0.73cm" background-color="#353839" />
                </fo:simple-page-master>
            </fo:layout-master-set>

            <fo:page-sequence master-reference="masterpage">
                <!-- static content, such as footer(region-before) and header(region-after) -->
                <fo:flow flow-name="xsl-region-body" display-align="center" width="21cm">
                    <xsl:apply-templates select="//Reservation[@offerId = $offerID and @courseId = $courseID]" />
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>


    <xsl:template match="Reservation[last()]">
        <fo:table space-after.optimum="20pt" font-size="11pt" margin="10">
            <fo:table-column column-number="1" />
            <fo:table-column column-number="2"/>
            <fo:table-column column-number="3"/>
            <fo:table-body>
                <fo:table-row>
                    <fo:table-cell number-columns-spanned="3" height="100" display-align="after" text-align="center">
                        <fo:block font-size="24pt" font-family="Georgia" color="white" text-align="center">
                            Vielen Dank <xsl:value-of select="FirstName" />
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                    <fo:table-cell number-columns-spanned="3"  height="50"  text-align="center">
                        <fo:block font-size="14pt" font-family="Georgia" color="white">
                            <fo:block>Deine Reservierung wurde bestätigt.</fo:block>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row height="100">
                    <fo:table-cell>
                        <fo:block><!--divider--></fo:block>
                    </fo:table-cell>
                </fo:table-row>

                <fo:table-row border-after-width="0.1" border-after-color="grey" border-after-style="solid">
                    <fo:table-cell column-number="2"  text-align="center">
                        <fo:block font-size="14pt" font-family="Georgia" color="white">
                            <fo:block><xsl:value-of select="$selectedOffer/title" /></fo:block>
                            <fo:block color="grey">Kurs</fo:block>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row height="10">
                    <fo:table-cell>
                        <fo:block><!--divider--></fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                    <fo:table-cell border-right-width="0.1" border-right-style="solid" border-right-color="grey">
                        <fo:block font-size="14pt" font-family="Georgia" color="white" text-align="center">
                            <fo:block><xsl:value-of select="$selectedCourse/@time" /><xsl:text> </xsl:text><xsl:value-of select="$selectedCourse/@date" /></fo:block>
                            <fo:block color="grey">Datum &amp; Zeit</fo:block>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell border-right-width="0.1" border-right-style="solid" border-right-color="grey">
                        <fo:block font-size="14pt" font-family="Georgia" color="white" text-align="center">
                            <fo:block><xsl:value-of select="$selectedCourse/@trainer" /></fo:block>
                            <fo:block color="grey">Trainer</fo:block>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block font-size="14pt" font-family="Georgia" color="white" text-align="center">
                            <fo:block><xsl:value-of select="$selectedOffer/price" /></fo:block>
                            <fo:block color="grey">Preis</fo:block>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-body>
        </fo:table>
    </xsl:template>
</xsl:stylesheet>
