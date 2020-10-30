<?php
  header("Access-Control-Allow-Origin: *");
  require "enumerations/Enumerations.php";
  if($_SERVER['REQUEST_METHOD'] == RequestMethods::GET) {
    header("Content-Type: application/json; charset=UTF-8");
    require 'db_handling/Database.php';
    $database = new Database();
    $data = $database->getEvents();
    
    $list = array();
    foreach($data as $row){
      $list[] = array(
        "name" => $row['name'],
        "description" => $row['description'],
        "date" => $row['date']
      );    
    }
    echo json_encode($list);
  } else {
    header(RequestStatus::methodNotAllowed);
  }
?>