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
    <script type="text/javascript" src="js/lib/jquery.min.js"> </script>
    <script type="text/javascript" src="js/lib/bootstrap.min.js"> </script>
</head>
<body onload="restoreStyle('big.font.size')">

    <!-- NAVBAR -->
    <div class="navbar navbar-expand-lg fixed-top navbar-dark bg-primary">

        <div class="container">
            <a href="./index.xhtml" class="navbar-brand">Fiescher Sportzentrum</a>
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
                        require 'php/offer_details.php';
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

        <!-- FEEDBACK -->
        <div class="bs-docs-section clearfix">
            <div class="row">
                <div class="col-lg-12">

                    <h2>Bewertungen unserer Kunden</h2>
                    <div class="bs-component">
                        <div class="card mb-3">
                            <div class="card-body">
                                <h5 class="card-title">
                                    Bewertung:
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                </h5>
                                <button type="button" class="btn btn-info text-right">Details öffnen</button>
                            </div>
                        </div>
                    </div>
                    <!-- TODO: show feedback.  -->

                </div>
            </div>
        </div>

        <!-- RESERVATION -->
        <div class="bs-docs-section clearfix">
            <div class="row">
                <div class="col-lg-12">

                    <h2>Jetzt registrieren!</h2>
                    <!-- TODO: show reservation form.  -->

                    <?php
                    $xml_ForReservation = new DOMDocument();
                    $xml_ForReservation->load('../database/offer.xml');
                    $xsl_ForReservation = new DOMDocument;
                    $xsl_ForReservation->load('../xslt/offer_courses.xsl');

                    $proc_ForReservation = new XSLTProcessor();
                    $proc_ForReservation->setParameter(null, 'offerID', $_GET['id']);
                    $proc_ForReservation->importStyleSheet($xsl_ForReservation);
                    echo $proc_ForReservation->transformToXML($xml_ForReservation);
                    ?>
                </div>
            </div>

            <div class="modal" id="myModal" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header" style="padding:35px 50px;">
                            <h3><span class="glyphicon glyphicon-lock"> </span> Reservation Erfassen</h3>
                        </div>
                        <form role="form" action="php/addreservation.php" method="post" target="_blank">
                            <input type="hidden" id="courseId" name="courseId" value="" />
                            <input type="hidden" id="offerId" name="offerId" value="" />
                            <div class="modal-body" style="padding:40px 50px;">
                                <h6 id="title" name="title"></h6>
                                <br/>
                                <div class="form-group">
                                    <label for="FirstName"><span class="glyphicon glyphicon-user"> </span> FirstName</label>
                                    <input type="text" class="form-control" id="FirstName" name="FirstName" placeholder="Vornamen eingeben" name="FirstName" />
                                </div>
                                <div class="form-group">
                                    <label for="LastName"><span class="glyphicon glyphicon-user"> </span> LastName</label>
                                    <input type="text" class="form-control" id="LastName" name="LastName" placeholder="Nachnamen eingeben" />
                                </div>
                                <div class="form-group">
                                    <label for="Address"><span class="glyphicon glyphicon-road"> </span> Address</label>
                                    <input type="text" class="form-control" id="Address" name="Address" placeholder="Addresse eingeben" />
                                </div>
                                <div class="form-group">
                                    <label for="City"><span class="glyphicon glyphicon-home"> </span> Stadt</label>
                                    <input type="text" class="form-control" id="City" name="City" placeholder="Stadt eingeben" />
                                </div>
                                <div class="form-group">
                                    <label for="PLZ"><span class="glyphicon glyphicon-map-marker"> </span> PLZ</label>
                                    <input type="number" class="form-control" id="PLZ" name="PLZ" placeholder="PLZ eingeben" />
                                </div>
                                <div class="form-group">
                                    <label for="Mail"><span class="glyphicon glyphicon-envelope"> </span> EMail</label>
                                    <input type="text" class="form-control" id="Mail" name="Mail" placeholder="EMail eingeben" />
                                </div>
                                <div class="form-group">
                                    <label for="PhoneNumber"><span class="glyphicon glyphicon-phone"> </span> Telefon Nr</label>
                                    <input type="number" class="form-control" id="PhoneNumber" name="PhoneNumber" placeholder="Telefon Nr eingeben" />
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-danger .btn-lg" data-dismiss="modal"><span class="glyphicon glyphicon-remove"> </span> Abbrechen</button>
                                <button type="submit" class="btn btn-success .btn-lg"><span class="glyphicon glyphicon-ok"> </span> Best&auml;tigen</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>


            <!-- adds an onclick function to buttons with class .addreservationbutton -->
            <!-- buttons must have a data-offerid="[0-99]" and  data-courseid="[0-99]" to indicate the chosen course and offer -->
            <script type="text/javascript">
                $(document).ready(function(){
                    $(".addreservationbutton").click(function(){ // Click to only happen on reservation buttons
                        $("#courseId").val($(this).data('courseid'));
                        $("#offerId").val($(this).data('offerid'));
                        $("#title").text($(this).data('title'));
                        $('#myModal').modal('show');
                    });
                });
            </script>
        </div>


        <!-- FOOTER -->
        <div class="bs-docs-section clearfix">
            <div class="row">
                <div class="col-lg-12">
                    <a href="index.xhtml">
                        <button type="button" class="btn btn-info col-lg-12">
                            <span class="glyphicon glyphicon-circle-arrow-left"> </span>
                            zurück zur Übersicht
                        </button>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="js/style.js"></script>
</body>
</html>