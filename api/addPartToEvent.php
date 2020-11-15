<?php
header("Access-Control-Allow-Origin: *");
require "enumerations/Enumerations.php";
if($_SERVER["REQUEST_METHOD"] == RequestMethods::POST) {
    if(isset($_POST['partID']) && isset($_POST['eventID']) && isset($_POST['position'])) {
        require 'db_handling/Database.php';
        $database = new Database();
        $partID = $_POST['partID'];
        $eventID = $_POST['eventID'];
        $position = $_POST['position'];
        $database->addPartToEvent($eventID,$partID,$position);
    } else {
      header(RequestStatus::badRequest);
    }
} else {
    header(RequestStatus::methodNotAllowed);
}   
?>