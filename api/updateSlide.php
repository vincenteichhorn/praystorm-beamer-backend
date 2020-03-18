<?php
$data = json_decode($_POST['data']);

require 'config/Database.php';
$database = new Database();
$input = array();
foreach($data['newdata'] as $key=>$value){
    $input[]=array($key,$value);
}
$database->updateSlide($data['part_id'],$data['title'],$input);
?>