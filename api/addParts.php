<?php
$data = json_decode($_POST['data']);

require 'database.php';
$database = new Database();
foreach($data as $row){
    $database->addPart($row);
}
$condition = array(
    array("eventID",$data['eventID']),
    array("title",$data['title'])
);
foreach($data as $row){
    if($database->countElements("slides",$condition)==0){
        $database->addPart($row);
    }else{
        echo "Slide existiert bereits";
    }
}
?>