<?php
$uploadfile = "tmpdata/tmpsongfile.txt";

echo '<pre>';
if (move_uploaded_file($_FILES['userfile']['tmp_name'], $uploadfile)) {
    echo "Datei ist valide und wurde erfolgreich hochgeladen.\n";
} else {
    echo "Möglicherweise eine Dateiupload-Attacke!\n";
}
print "</pre>";

$handle = fopen ( "tmpdata/tmpsongfile.txt", "r" );
$data = fgets($handle);
$song = array();
$song['type']="SONG";
$song['title']=$data;
$song['copyright']="";
$counter = 0;
while($data=fgets($handle)){
    $counter++;
    if(substr($data,0,-2)!=""){
        if($counter == 3){
            $key = $data;
            $song['slides'][$key] = array();
        }else if($counter > 3){
            $song['slides'][$key][] = substr($data,0,-2);
        }else if($counter == 2){
            for($i=1;$i<5;$i++){
                $song['copyright'] = $song['copyright'].$data;
                $data = fgets($handle);
            }
        }
    }else{
        if($counter>2) $counter=1;
    }
}
fclose($handle);

require 'config/Database.php';
$database = new Database();
$condition = array(
    array("title",$song['title'])
);
if($database->countElements("parts",$condition)==0){
    $database->addPart($song);
}else{
    echo die("Part existiert bereits");
}
$data = array();
$i = 0;
$partID = $database->getPartIDByTitle($song['title']);
foreach($song['slides'] as $title=>$slide){
    $data[$i]['partID'] = $partID;
    $data[$i]['title'] = $title;
    $shorthand = $title[0];
    if(isset(explode(" ",$title)[1])) $shorthand = $shorthand.explode(" ",$title)[1];
    $data[$i]['shorthand'] = $shorthand;
    $data[$i]['position'] = $i;
    $data[$i]['type'] = "SONGPART";
    $slidedata = array(
        "lyrics" => $song['slides'][$title], 
        "image" => "http://localhost/praystorm-beamer-backend/images/test.jpg",
        "video" => "http://localhost/praystorm-beamer-backend/images/video.mp4"
    );
    $data[$i]['data'] = json_encode($slidedata);
    $i++;
}

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

echo "<pre>";
print_r($song);
echo "</pre>";

unlink($uploadfile);
?>