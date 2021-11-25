<?php
header("Access-Control-Allow-Origin: *");
require "enumerations/Enumerations.php";
if($_SERVER["REQUEST_METHOD"] == RequestMethods::POST) {
    if(isset($_POST['data']) 
        AND isset($_POST['partTitle']) 
        AND isset($_POST['partAuthor']) 
        AND isset($_POST['slideTitle']) 
        AND isset($_POST['oldSlideTitle']) 
        AND isset($_POST['slideType'])
        AND isset($_POST['styleName'])) {
        require 'db_handling/Database.php';
        $partTitle = $_POST['partTitle'];
        $partAuthor = $_POST['partAuthor'];
        $slideTitle = $_POST['slideTitle'];
        $oldSlideTitle = $_POST['oldSlideTitle'];
        $type = $_POST['slideType'];
        $data = $_POST['data'];
        $styleName = $_POST['styleName'];
        $database = new Database();
        $partID = $database->getPartIDByTitleAndAuthor($partTitle, $partAuthor);
        $condition = array(
            array("id",$partID),
        );
        $styleID = $database->getStyle($styleName)['id'];
        if($database->countElements("parts",$condition)!=0){
            $database->updateSlide($partID,$oldSlideTitle, $slideTitle, $type, $data, $styleID);
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