<?php
$data = json_decode($_POST['data']);

require 'database.php';
$database = new Database();
foreach($data as $row){
    $condition = array(
        array("part_id",$row['part_id']),
        array("title",$row['title'])
    );
    if($database->countElements("slides",$condition)==0){
        $database->addSlide($row);
    }else{
        echo "Slide existiert bereits. ";
    }
}
?>