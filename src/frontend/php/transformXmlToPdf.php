<?php
/**
 * Created by IntelliJ IDEA.
 * User: Yannick Luthiger
 * Date: 09.02.2018
 * Time: 13:38
 */
require_once 'FO/fop_service_client.php';

transformXmlToPdf();

function transformXmlToPdf() {

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
    $processor->setParameter(null, offerID, "1");
    $processor->setParameter(null, courseID, "1");
    $processor->transformToDoc($xml)->save($reservationFoPath);





    /** service appears to be not available
    // create an instance of the FOP client and perform service request.
    $serviceClient = new FOPServiceClient();
    $pdfFile = $serviceClient->processFile($reservationFoPath);

    // generate HTML output and show results of service request
    echo '<h1>FOP Service Client</h1>';
    echo sprintf('<p>Successfully rendered FO File<br><strong><a href="%s">%s</a></strong></p>', $foFile, $foFile);
    echo sprintf('<p>Generated PDF:<br><strong><a href="%s">%s</a></strong></p>', $pdfFile, $pdfFile);
    */

}
?>