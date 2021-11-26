<?php
header("Access-Control-Allow-Origin: *");
require "enumerations/Enumerations.php";
if($_SERVER["REQUEST_METHOD"] == RequestMethods::POST) {
    if(isset($_POST['styleName'])) {
        require 'db_handling/Database.php';
        $styleName = $_POST['styleName'];
        $database = new Database();
        $styleID = $database->getStyle($styleName)['id'];
        $slides = $database->getSlideByStyle($styleID);
        $newStyleId = $styleID;
        $count = 0;
        while($styleID == $newStyleId) {
            $newStyleId = $database->getSlideStyles(true)[$count]['id'];
            $count++;
        }
        foreach($slides as $slide) {
            $database->updateSlide($slide['partID'], $slide['title'], $slide['title'], $slide['type'], $slide['data'], $newStyleId);
        }
        $database->deleteStyle($styleID);
    } else {
      header(RequestStatus::badRequest);
    }
} else {
    header(RequestStatus::methodNotAllowed);
}
?>