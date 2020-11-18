<?php
header("Access-Control-Allow-Origin: *");
require "enumerations/Enumerations.php";
if($_SERVER["REQUEST_METHOD"] == RequestMethods::POST) {
    if(isset($_POST['partTitle']) && isset($_POST['partAuthor']) && isset($_POST['eventName']) 
       && isset($_POST['eventDate']) && isset($_POST['partPosition'])) {
        require 'db_handling/Database.php';
        $database = new Database();
        $partTitle = $_POST['partTitle'];
        $partAuthor = $_POST['partAuthor'];
        $eventName = $_POST['eventName'];
        $eventDate = $_POST['eventDate'];
        $partPosition = $_POST['partPosition'];
        $conditionEvent = array(
            array("name", $eventName),
            array("date", $eventDate)
        );
        if($database->countElements("events", $conditionEvent) == 1){
            $database->addPartToEvent($partTitle, $partAuthor, $partPosition, $eventName, $eventDate);
        }else{
            header(RequestStatus::badRequest);
        }
    } else {
      header(RequestStatus::badRequest);
    }
} else {
    header(RequestStatus::methodNotAllowed);
}   
?>