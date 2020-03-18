<?php
$data = json_decode($_POST['data']);

require 'config/Database.php';
$database = new Database();
$database->deletePart($data['title']);
?>