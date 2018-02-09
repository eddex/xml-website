<?php
    //addReservation("Trevor", "Smith", "Road 66", "Kentucky", "1992", "smithtrevor@gmail.com", "0791006564",1,1);


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
        // file path, hardcoded because we only have 1 reservation file and this should not change
        $FilePath = "..\\database\\reservation.xml";

        // load the reservation.xml
        $reservationXml =  simplexml_load_file($FilePath);

        // add a new reservation
        $newReservation = $reservationXml->addChild('Reservation');

        // new (sub)elements to reservation
        $newReservation->addChild('FirstName',$FirstName);
        $newReservation->addChild('LastName',$LastName);
        $newReservation->addChild('Address',$Address);
        $newReservation->addChild('City',$City);
        $newReservation->addChild('PLZ',$PLZ);
        $newReservation->addChild('Mail',$Mail);
        $newReservation->addChild('PhoneNumber',$PhoneNumber);

        // add new attributes to reservation
        $newReservation->addAttribute('offerId', $OfferId);
        $newReservation->addAttribute('courseId', $CourseId);

        // save changes to xml
        $reservationXml->saveXML($FilePath);
    }
?>