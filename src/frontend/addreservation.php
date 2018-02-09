<?php

include 'example.php';

function addreservation($FirstName, $LastName, $Address, $City, $PLZ, $Mail, $PhoneNumber, $OfferId, $CourseId) {
    //new elements
    $FirstName ="Trevor";
    $LastName = "Smith";
    $Address = "Road 66";
    $City = "Kentucky";
    $PLZ = "1992";
    $Mail = "smithtrevor@gmail.com";
    $PhoneNumber = "0791006564";

    // new attribute
    $OfferId = "1";
    $CourseId = "1";

    // file path, hardcoded because we only have 1 reservation file and this should not change
    $FilePath = "../reservation.xml"

    // load the reservation.xml
    $reservationXml = new DOMDocument();
    $reservationXml->load($FilePath);

    //******************** add childs and attributes ***************************
        // add a new reservation
    $newReservation= $reservationXml->addChild('Reservation');

        // new elements
    $newReservation->addChild('FirstName','$FirstName')
    $newReservation->addChild('LastName','$LastName')
    $newReservation->addChild('Address','$Address')
    $newReservation->addChild('City','$City')
    $newReservation->addChild('PLZ','$PLZ')
    $newReservation->addChild('Mail','$Mail')
    $newReservation->addChild('PhoneNumber','$PhoneNumber')

        // new attributes
    $newReservation->addAttribute('offerId', '$OfferId');
    $newReservation->addAttribute('courseId', '$CourseId');



    ////******************** save changes to xml *******************************
    $reservationXml->Save($FilePath);
}
?>