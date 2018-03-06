<?php

function printOfferTitle($offerId)
{
    printOfferElementText($offerId, 'title');
}

function printOfferDescription($offerId)
{
    printOfferElementText($offerId, 'description');
}

function printOfferElementText($offerId, $elementName)
{
    $xPathQuery = "//offer[@id = '" . $offerId . "']/" . $elementName;
    $offerXml =  simplexml_load_file("../database/offer.xml");
    $offerTitle = $offerXml->xpath($xPathQuery);
    //print_r($offerTitle);

    // the $offerTitle array contains a simpleXMLElement that contains a string with the text of the $elementName element
    echo (string) $offerTitle[0][0];
}

function printCourseDetailsWithReservation($offerID)
{

    $xml_ForReservation = new DOMDocument();
    $xml_ForReservation->load('../database/offer.xml');
    $xsl_ForReservation = new DOMDocument;
    $xsl_ForReservation->load('../xslt/offer_courses.xsl');

    $proc_ForReservation = new XSLTProcessor();
    $proc_ForReservation->setParameter(null, 'offerID', $offerID);
    $proc_ForReservation->importStyleSheet($xsl_ForReservation);
    echo $proc_ForReservation->transformToXML($xml_ForReservation);
}



