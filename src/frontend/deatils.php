<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="description" content="Dies ist die Detailseite zu einem Angebot."/>
    <!-- CSS FRAMEWORKS -->
    <link rel="stylesheet" href="css/lib/flatly.bootstrap.min.css" />
    <link rel="stylesheet" href="css/lib/flatly.custom.min.css" />
    <link rel="stylesheet" href="css/lib/glyphicon.css" />
    <!-- ACCESSIBILITY STYLES -->
    <link id="style" rel="stylesheet" href="css/accessibility/none.css" />
</head>
<body onload="restoreStyle('big.font.size')">

    <!-- NAVBAR -->
    <div class="navbar navbar-expand-lg fixed-top navbar-dark bg-primary">

        <div class="container">
            <a href="../" class="navbar-brand">Unsere Tolle Sportanlage</a>
        </div>
    </div>


    <!-- Everything after this line is only displayed if an order id is present -->

    <!-- TODO: add offer with description, text to speech, rating and order form -->
    <!-- CONTENT -->
    <div class="container">

        <?php

        // this page can only be displayed when an order id is passed as parameter.
        $id = $_GET['id'];
        if (!isset($id)
            || $_GET['id'] == ''
            || !ctype_digit($id)){
            echo "Please don't hack this website :(";
            echo "\n</div>\n</body>\n</html>";
            return;
        }
        ?>

        <!-- HEAD -->
        <div class="page-header" id="banner">
            <div class="row">
                <div class="col-lg-8">
                    <h1>
                        <?php
                        // only require this file once. works for the rest of the document.
                        require 'php/offer_deatils.php';
                        printOfferTitle($_GET['id']);
                        ?>
                    </h1>
                    <p class="lead">
                        <?php
                        printOfferDescription($_GET['id']);
                        ?>
                    </p>
                </div>
            </div>
        </div>
    </div>

<script type="text/javascript" src="js/style.js"></script>
</body>
</html>