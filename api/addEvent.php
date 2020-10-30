<?php
header("Access-Control-Allow-Origin: *");
require "enumerations/Enumerations.php";
if($_SERVER["REQUEST_METHOD"] == RequestMethods::POST) {
    if(isset($_POST['name']) && isset($_POST['date']) && isset($_POST['description'])) {
      require 'config/Database.php';
      $database = new Database();
      $name = $_POST['name'];
      $date = $_POST['date'];
      $desc = $_POST['description'];
      $condition = array(
        array($name),
        array($date)
        );
        if($database->countElements("events", $condition) == 0){
            $database->addEvent(array("name" => $name, "date" => $date, "description" => $desc));
        } else {
            header(RequestStatus::badRequest);
            echo json_encode(array("error" => 'Das Event konnte nicht erstellt werden, da es bereits existiert'));
        }
    } else {
      header(RequestStatus::badRequest);
    }
} else {
header(RequestStatus::methodNotAllowed);
}   
?>
