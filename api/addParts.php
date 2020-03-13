<?php
$data = json_decode($_POST['data']);

require 'database.php';
$database = new Database();
foreach($data as $row){
    $condition = array(
        array("eventID",$row['eventID']),
        array("title",$row['title'])
    );
    if($database->countElements("parts",$condition)==0){
        $database->addPart($row);
    }else{
        echo "Part existiert bereits";
    }
}
?>