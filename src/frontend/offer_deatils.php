<?php

    // get value of the offerID parameter: offer_details.php?offerId=X
    if (!isset($_GET['offerId'])){
        echo "Error :(";
        return;
    }
    $offerId = $_GET['offerId'];

    // load offer.xml
    $OffersDbPath = "..\\database\\offer.xml";
    $offerXml =  simplexml_load_file($OffersDbPath);

    // get offer to display by offer id
    $xPathQuery = '//offer[id = ' . $offerId . ']';
    $offerToDisplay = $offerXml->xpath($xPathQuery);

    echo 'done processing. offer id : ' . $offerId;
    // TODO: perform XSLT and display output on page

