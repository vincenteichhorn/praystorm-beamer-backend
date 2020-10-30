<?php
$data = json_decode($_POST['data']);

require 'db_handling/Database.php';
$database = new Database();
$database->deleteEvent($data['name'],$data['date']);
?>