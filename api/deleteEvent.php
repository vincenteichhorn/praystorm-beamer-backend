<?php
$data = json_decode($_POST['data']);

require 'database.php';
$database = new Database();
$database->deleteEvent($data['name'],$data['date']);
?>