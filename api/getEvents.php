<?php
  header("Access-Control-Allow-Origin: *");
  header("Content-Type: application/json; charset=UTF-8");
  
  require 'database.php';
  $database = new Database();
  $data = $database->getEvents();
  
  $list = array();
  foreach($data as $row){
  $list[]=array("name"=>$row['name'],"date"=>$row['date'],"description"=>$row['description']);    
  }
  echo json_encode($list);
?>