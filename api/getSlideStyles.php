<?php
  header("Access-Control-Allow-Origin: *");
  header("Content-Type: application/json; charset=UTF-8");
  require "enumerations/Enumerations.php";
  if($_SERVER["REQUEST_METHOD"] == RequestMethods::GET) {
    require 'db_handling/Database.php';
    $database = new Database();
    $data = $database->getSlideStyles();
    echo json_encode($data);
  }
?>