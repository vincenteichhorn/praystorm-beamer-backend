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
    if(isset($_POST['title']) && isset($_POST['type']) && isset($_POST['author']) && isset($_POST['album']) && isset($_POST['copyright']) && isset($_POST['eventName'])) {
        require 'db_handling/Database.php';
        $database = new Database();
        $data = array(
            "title" => $_POST['title'];
            "type" => $_POST['type'];
            "author" => $_POST['author'];
            "album" => $_POST['album'];
            "copyright" => $_POST['copyright'];
        )
        $condition = array(
            array("title", $title),
            array("author", $author)
        );
        if($database->countElements("parts",$condition)==0){
            $database->addPart($data);
        } else {
            header(RequestStatus::badRequest);
        }
    } else {
      header(RequestStatus::badRequest);
    }
} else {
    header(RequestStatus::methodNotAllowed);
}   

?>