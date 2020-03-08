<?php
  header("Access-Control-Allow-Origin: *");
  header("Content-Type: application/json; charset=UTF-8");
  
  $data = ['localIpAddress' => getHostByName(getHostName())];
  print_r(json_encode($data));
?>