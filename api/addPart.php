<?php
/*
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
*/
header("Access-Control-Allow-Origin: *");
require "enumerations/Enumerations.php";
if($_SERVER["REQUEST_METHOD"] == RequestMethods::POST) {
    if(isset($_POST['partTitle']) && isset($_POST['partType']) && isset($_POST['partAuthor']) && isset($_POST['partAlbum']) 
    && isset($_POST['partCopyright']) && isset($_POST['partPosition']) && isset($_POST['eventDate'])&& isset($_POST['eventName'])) {
        require 'db_handling/Database.php';
        $database = new Database();
        $data = array(
            "title" => $_POST['partTitle'];
            "type" => $_POST['partType'];
            "author" => $_POST['partAuthor'];
            "album" => $_POST['partAlbum'];
            "copyright" => $_POST['partCopyright'];
        )
        /*
        "copyright" => $_POST['partPosition'];
        "copyright" => $_POST['eventDate'];
        "copyright" => $_POST['eventName'];*/
        $condition = array(
            array("title", $title),
            array("author", $author)
        );
        if($database->countElements("parts",$condition)==0){
            $database->addPart($data);
        } else {
            header(RequestStatus::badRequest);
        }
        $conditionEvent = array(
            array("name", $eventName),
            array("date", $eventDate)
        );
        if($database->countElements("events", $conditionEvent) == 1){
            $database->addPartToEvent($partTitle, $partAuthor, $partPosition, $eventName, $eventDate);
        }else{
            header(RequestStatus::badRequest);
        }
    } else {
      header(RequestStatus::badRequest);
    }
} else {
    header(RequestStatus::methodNotAllowed);
}   

?>