<?php
$data = json_decode($_POST['data']);

require 'database.php';
$database = new Database();
$input = array();
foreach($data['newdata'] as $key=>$value){
    $input[]=array($key,$value);
}
$database->updatePart($data['eventID'],$data['title'],$input);
?>