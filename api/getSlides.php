<?php
  header("Access-Control-Allow-Origin: *");
  header("Content-Type: application/json; charset=UTF-8");
  require "enumerations/Enumerations.php";
  if($_SERVER["REQUEST_METHOD"] == RequestMethods::POST) {
    require 'db_handling/Database.php';
    $database = new Database();
    $data = $database->getSlides($_POST['partTitle']);
    $list = array();
    foreach($data as $row){
      $list[] = array(
        "title" => $row['title'],
        "shorthand" => $row['shorthand'],
        "type" => $row['type'],
        "data" => json_decode($row['data'], true)
      );    
    }
    echo json_encode($list);
  }
?>