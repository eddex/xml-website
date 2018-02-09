<?php

//include 'example.php';
echo "Hello World";
/**
 * @param $FirstName
 * @param $LastName
 * @param $Address
 * @param $City
 * @param $PLZ
 * @param $Mail
 * @param $PhoneNumber
 * @param $OfferId
 * @param $CourseId
 */
function addReservation($FirstName, $LastName, $Address, $City, $PLZ, $Mail, $PhoneNumber, $OfferId, $CourseId) {
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
    $FilePath = "..\\database\\reservation.xml";

    // load the reservation.xml
    $reservationXml =  simplexml_load_file($FilePath);

    //******************** add child's and attributes ***************************
        // add a new reservation
    $newReservation = $reservationXml->addChild('Reservation');

        // new elements
    $newReservation->addChild('FirstName',$FirstName);
    $newReservation->addChild('LastName',$LastName);
    $newReservation->addChild('Address',$Address);
    $newReservation->addChild('City',$City);
    $newReservation->addChild('PLZ',$PLZ);
    $newReservation->addChild('Mail',$Mail);
    $newReservation->addChild('PhoneNumber',$PhoneNumber);

        // new attributes
    $newReservation->addAttribute('offerId', $OfferId);
    $newReservation->addAttribute('courseId', $CourseId);



    ////******************** save changes to xml *******************************
    $reservationXml->saveXML($FilePath);
}
?>