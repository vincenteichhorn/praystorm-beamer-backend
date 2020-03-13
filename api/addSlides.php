<?php
$data = json_decode($_POST['data']);

require 'database.php';
$database = new Database();
$condition = array(
    array("part_id",$data['part_id']),
    array("title",$data['title'])
);
foreach($data as $row){
    if($database->countElements("slides",$condition)==0){
        $database->addSlide($row);
    }else{
        echo "Slide existiert bereits";
    }
}
?>