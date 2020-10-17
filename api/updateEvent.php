<?php
$data = (array) json_decode($_POST['data'], true);

require 'config/Database.php';
$database = new Database();
$input = array();
foreach($data['newdata'] as $key=>$value){
    $input[]=array($key,$value);
}
$database->updateEvent($data['name'],$data['date'],$input);
?>