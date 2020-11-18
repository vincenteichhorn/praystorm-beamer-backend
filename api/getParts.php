<?php
  header("Access-Control-Allow-Origin: *");
  require "enumerations/Enumerations.php";
  if($_SERVER["REQUEST_METHOD"] == RequestMethods::GET) {
    header("Content-Type: application/json; charset=UTF-8");
    require 'db_handling/Database.php';
    $database = new Database();
    $data = $database->getParts();
    $list = array();
    foreach($data as $row){ 
    $list[] = array(
        "title"=>$row['title'],
        "type"=>$row['type'],
        "author"=>$row['author'],
        "album"=>$row['album'],
        "copyright"=>$row['copyright'],
        "position"=>$row['position']
    );    
    }
    echo json_encode($list);
  } else {
    header(RequestStatus::methodNotAllowed);
  }
?>