<?php
  header("Access-Control-Allow-Origin: *");
  header("Content-Type: application/json; charset=UTF-8");
  
  $data = ['localIPAddress' => getHostByName(getHostName())];
  echo json_encode($data);
?>