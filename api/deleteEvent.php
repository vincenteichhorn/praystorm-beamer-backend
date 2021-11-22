<?php
header("Access-Control-Allow-Origin: *");
require "enumerations/Enumerations.php";
if($_SERVER["REQUEST_METHOD"] == RequestMethods::POST) {
    if(isset($_POST['eventName']) AND isset($_POST['eventDate'])) {
        require 'db_handling/Database.php';
        $eventDate = $_POST['eventDate'];
        $eventName = $_POST['eventName'];
        $database = new Database();
        $database->deleteEvent($eventName, $eventDate);
    } else {
      header(RequestStatus::badRequest);
    }
} else {
    header(RequestStatus::methodNotAllowed);
}
?>