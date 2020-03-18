<?php
//$data = json_decode($_POST['data']);

$data = array(
    "part_id" => ''
);

require 'config/Database.php';
$database = new Database();
$database->deleteSlide($data['part_id'],$data['slide']);
?>