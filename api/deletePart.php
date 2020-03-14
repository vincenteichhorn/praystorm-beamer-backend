<?php
$data = json_decode($_POST['data']);

require 'database.php';
$database = new Database();
$database->deletePart($data['title']);
?>