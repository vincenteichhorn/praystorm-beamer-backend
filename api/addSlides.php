<?php
$data = (array) json_decode($_POST['data'], true);

require 'config/Database.php';
$database = new Database();
foreach($data as $row){
    $condition = array(
        array("partID",$row['partID']),
        array("title",$row['title'])
    );
    if($database->countElements("slides",$condition)==0){
        $database->addSlide($row);
    }else{
        echo "Slide existiert bereits. ";
    }
}
?>