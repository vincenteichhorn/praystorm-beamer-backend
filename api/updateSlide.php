<?php
header("Access-Control-Allow-Origin: *");
require "enumerations/Enumerations.php";
if($_SERVER["REQUEST_METHOD"] == RequestMethods::POST) {
    if(isset($_POST['data']) AND isset($_POST['partTitle']) AND isset($_POST['partAuthor']) AND isset($_POST['slideTitle'])) {
        require 'db_handling/Database.php';
        $partTitle = $_POST['partTitle'];
        $partAuthor = $_POST['partAuthor'];
        $slideTitle = $_POST['slideTitle'];
        $data = $_POST['data'];
        $database = new Database();
        $partID = $database->getPartIDByTitleAndAutor($_POST['partTitle'],$_POST['partAuthor']);
        $condition = array(
            array("partID",$partID),
            array("title",$slideTitle)
        );
        if($database->countElements("parts",$condition)==0){
            $database->updateSlide($partID,$slideTitle,$data);
        } else {
            header(RequestStatus::badRequest);
        }

    } else {
      header(RequestStatus::badRequest);
    }
} else {
    header(RequestStatus::methodNotAllowed);
}

/*
$data = (array) json_decode($_POST['data'], true);

require 'db_handling/Database.php';
$database = new Database();
$input = array();
foreach($data['newdata'] as $key=>$value){
    $input[]=array($key,$value);
}
$database->updateSlide($data['part_id'],$data['title'],$input);
*/
?>