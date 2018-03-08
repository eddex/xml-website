<?php
require_once 'FO/fop_service_client.php';

function transformXmlToPdf($offerId, $courseId) {
    // file path, hardcoded because we only have 1 reservation file and this should not change
    $reservationXmlPath = "../../database/reservation.xml\"";
    $reservationFoPath = "FO/reservation.fo";
    $xml =  simplexml_load_file($reservationXmlPath);

    // load xsl
    $xsl = new DOMDocument();
    $xsl->load('../../xslt/reservation.xslt');

    // transform to FO
    $processor = new XSLTProcessor();
    $processor->importStylesheet($xsl);
    $processor->setParameter(null, 'offerID', $offerId);
    $processor->setParameter(null, 'courseID', $courseId);
    $processor->transformToDoc($xml)->save($reservationFoPath);


    // create an instance of the FOP client and perform service request.
    $serviceClient = new FOPServiceClient();
    $generatedPdfData = $serviceClient->processFile($reservationFoPath);

    // show generated pdf in browser
    header('Content-Type: application/pdf');
    header('Content-Length: ' . strlen($generatedPdfData));
    header('Content-Disposition: inline; filename="reservation.pdf"');
    header('Cache-Control: private, max-age=0, must-revalidate');
    header('Pragma: public');
    ini_set('zlib.output_compression','0');
    die($generatedPdfData);
}
?>
