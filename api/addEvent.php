<?php
$name = $_POST['name'];
$date = $_POST['date'];
$desc = $_POST['description'];

require 'config/Database.php';
$database = new Database();
$condition = array(
    array($name),
    array($date)
);
if($database->countElements("events",$condition)==0){
    $database->addEvent(array("name"=>$name, "date"=>$date, "description"=>$desc));
}else{
    echo "Event existiert bereits";
}
?>