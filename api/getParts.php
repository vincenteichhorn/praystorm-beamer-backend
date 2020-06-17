<?php
  header("Access-Control-Allow-Origin: *");
  require "enumerations/Enumerations.php";
  if($_SERVER["REQUEST_METHOD"] == RequestMethods::POST) {
    if(isset($_POST['name']) && isset($_POST['date'])) {
      header("Content-Type: application/json; charset=UTF-8");
      require 'config/Database.php';
      $database = new Database();
      $data = $database->getParts($_POST['name'], $_POST['date']);
      $list = array();
      foreach($data as $row){ 
        $list[] = array(
          "title"=>$row['title'],
          "position"=>$row['position'],
          "type"=>$row['type'],
          "author"=>$row['author'],
          "album"=>$row['album'],
          "copyright"=>$row['copyright']
        );    
      }
      echo json_encode($list);
    } else {
      header(RequestStatus::badRequest);
    }
  } else {
    header(RequestStatus::methodNotAllowed);
  }
?>