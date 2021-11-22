<?php
header("Access-Control-Allow-Origin: *");
require "enumerations/Enumerations.php";
if($_SERVER["REQUEST_METHOD"] == RequestMethods::POST) {
    if(isset($_POST['partTitle']) AND isset($_POST['partAuthor']) AND isset($_POST['eventName']) AND isset($_POST['eventDate']) AND isset($_POST['cascade'])) {
        require 'db_handling/Database.php';
        $partTitle = $_POST['partTitle'];
        $partAuthor = $_POST['partAuthor'];
        $eventName = $_POST['eventName'];
        $eventDate = $_POST['eventDate'];
        $cascade = $_POST['cascade'];
        $database = new Database();
        $partID = $database->getPartIDByTitleAndAuthor($partTitle, $partAuthor);
        $eventID = $database->getEventIDByNameAndDate($eventName, $eventDate);
        if(filter_var($cascade, FILTER_VALIDATE_BOOLEAN)) {
            $database->deletePartFromEvent($eventID, $partID);
            $database->deletePart($partTitle, $partAuthor);
        } else {
            $database->deletePartFromEvent($eventID, $partID);
        }

    } else {
      header(RequestStatus::badRequest);
    }
} else {
    header(RequestStatus::methodNotAllowed);
}
?>