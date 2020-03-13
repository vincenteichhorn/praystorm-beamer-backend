<?php
  require 'database.php';
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
?>