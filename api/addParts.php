<?php
$data = (array) json_decode($_POST['data'], true);

require 'db_handling/Database.php';
$database = new Database();
foreach($data as $row){
    $condition = array(
        array("title",$row['title'])
    );
    if($database->countElements("parts",$condition)==0){
        $database->addPart($row);
    }else{
        echo "Part existiert bereits";
    }
}
?>