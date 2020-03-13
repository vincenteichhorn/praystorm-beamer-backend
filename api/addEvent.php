<?php
$data = json_decode($_POST['data']);

require 'database.php';
$database = new Database();
$data = $database->addEvent($data);
?>