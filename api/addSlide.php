<?php
header("Access-Control-Allow-Origin: *");
require "enumerations/Enumerations.php";
if($_SERVER["REQUEST_METHOD"] == RequestMethods::POST) {
    if(isset($_POST['newTitle']) AND 
        isset($_POST['newShorthand']) AND 
        isset($_POST['newPositon']) AND 
        isset($_POST['newType']) AND 
        isset($_POST['newContent']) AND 
        isset($_POST['partTitle']) AND 
        isset($_POST['partAuthor'])) {
        require 'db_handling/Database.php';
        $database = new Database();
        $id = $database->getPartIDByTitleAndAutor($_POST['partTitle'],$_POST['partAuthor']);
        $condition = array(
            array("id", $id),
        );
        if($database->countElements("parts",$condition)!=0){
            $database->addSlide(array(
                array('id', null),
                array("partID",$id),
                array("title",$_POST['newTitle']),
                array("shorthand",$_POST['newShorthand']),
                array("position",$_POST['newPositon']),
                array("type",$_POST['newType']),
                array("data",$_POST['newContent'])
            ));
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