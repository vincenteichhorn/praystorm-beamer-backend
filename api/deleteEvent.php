<?php
$data = json_decode($_POST['data']);

require 'config/Database.php';
$database = new Database();
$database->deleteEvent($data['name'],$data['date']);
?>