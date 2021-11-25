<?php
header("Access-Control-Allow-Origin: *");
require "enumerations/Enumerations.php";
if($_SERVER["REQUEST_METHOD"] == RequestMethods::POST) {
    if(isset($_POST['eventName']) && isset($_POST['eventDate']) && isset($_POST['eventDesc']) && isset($_POST['identityName']) && isset($_POST['identityDate'])) {
        require 'db_handling/Database.php';
        $database = new Database();
        $name = $_POST['eventName'];
        $date = $_POST['eventDate'];
        $desc = $_POST['eventDesc'];
        $identityName = $_POST['identityName'];
        $identityDate = $_POST['identityDate'];
        $database->updateEvent($identityName, $identityDate, array(
            array('name', $name),
            array('date', $date),
            array('description', $desc),
        ));
        
    } else {
      header(RequestStatus::badRequest);
    }
} else {
    header(RequestStatus::methodNotAllowed);
}   
?>
