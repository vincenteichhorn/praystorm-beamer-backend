<?php
$data = json_decode($_POST['data']);
require 'config/Database.php';
$database = new Database();
$condition = array(
    array("name",$data['name']),
    array("date",$data['date'])
);
if($database->countElements("events",$condition)==0){
    $database->addEvent($data);
}else{
    echo "Event existiert bereits";
}
?>