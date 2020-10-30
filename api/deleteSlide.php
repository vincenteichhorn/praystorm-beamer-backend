<?php
//$data = json_decode($_POST['data']);

$data = array(
    "part_id" => ''
);

require 'db_handling/Database.php';
$database = new Database();
$database->deleteSlide($data['part_id'],$data['slide']);
?>