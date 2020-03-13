<?php
  header("Access-Control-Allow-Origin: *");
  header("Content-Type: application/json; charset=UTF-8");

  require 'database.php';
  $database = new Database();
  $data = $database->getSlides($_POST['partname']);
  $list = array();
  foreach($data as $row){
    $list[]=array(
      "title"=>$row['title'],
      "shorthand"=>$row['shorthand'],
      "type"=>$row['type'],
      "data"=>$row['data']
    );    
  }
  echo json_encode($list);
?>