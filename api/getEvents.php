<?php
  require 'database.php';
  $database = new Database();
  $data = $database->getEvents();

?>