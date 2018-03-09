<?php
  if($_POST["offerId"]!=null && isset($_POST["radio1"]) && isset($_POST["radio2"]) &&  isset($_POST["radio3"]) &&  isset($_POST["radio4"]) &&  isset($_POST["radio5"]) &&  isset($_POST["radio6"]))
  {
    bewertung($_POST["offerId"], $_POST["radio1"], $_POST["radio2"],  $_POST["radio3"],  $_POST["radio4"],  $_POST["radio5"],  $_POST["radio6"]);
?>
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta name="description" content="Dies ist die Detailseite zu einem Angebot."/>
        <!-- CSS FRAMEWORKS -->
        <link rel="stylesheet" href="../css/lib/flatly.bootstrap.min.css" />
        <link rel="stylesheet" href="../css/lib/flatly.custom.min.css" />
        <link rel="stylesheet" href="../css/lib/glyphicon.css" />
        <!-- ACCESSIBILITY STYLES -->
        <link id="style" rel="stylesheet" href="../css/accessibility/none.css" />
        <!-- JS FRAMEWORKS -->
        <script type="text/javascript" src="../js/lib/jquery.min.js"> </script>
        <script type="text/javascript" src="../js/lib/bootstrap.min.js"> </script>
    </head>
    <body>
    <div class="card" style="width: 18rem;">
      <div class="card-body">
        <h5 class="card-title">Danke!</h5>
        <h6 class="card-subtitle mb-2 text-muted">Sie bringen diese Seite weiter!</h6>
        <p class="card-text">Ihre Bewertung wurde erfolgreich erfasst.</p>
      </div>
    </div>
    </body>
    </html>
<?php
  }
  else{
?>
    <p>Da ging etwas schief... Überprüfe ob alle Punkte bewertet wurden.</p>
<?php

  }
?>

<?php
  function bewertung($offerId, $radio1, $radio2, $radio3, $radio4, $radio5, $radio6){

  $FilePath = "../../database/feedback.xml";

  // load the feedback.xml
  $FeedbackXml =  simplexml_load_file($FilePath);

  // add a new feedback
  $newFeedback = $FeedbackXml->addChild('feedback');

  // new (sub)elements to feedback
  $newFeedback->addChild('rating');

  // add new attributes to feedback
  $newFeedback->addAttribute('offerID', $offerId);
  // add new attributes to rating
  $newFeedback->rating->addAttribute('fun', $radio2);
  $newFeedback->rating->addAttribute('difficulty', $radio3);
  $newFeedback->rating->addAttribute('effort', $radio5);
  $newFeedback->rating->addAttribute('staff', $radio6);
  $newFeedback->rating->addAttribute('cost-effectiveness', $radio4);
  $newFeedback->rating->addAttribute('overall-rating', $radio1);

  // save changes to xml
  $FeedbackXml->saveXML($FilePath);

  }

?>
