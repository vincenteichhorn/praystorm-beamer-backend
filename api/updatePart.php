<?php
$data = (array) json_decode($_POST['data'], true);

require 'db_handling/Database.php';
$database = new Database();
$input = array();
foreach($data['newdata'] as $key=>$value){
    $input[]=array($key,$value);
}
$database->updatePart($data['eventID'],$data['title'],$input);
?>