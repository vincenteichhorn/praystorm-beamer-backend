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
$song['title']=$data;
$song['copyright']="";
$counter = 0;
while($data=fgets($handle)){
    $counter++;
    if(substr($data,0,-2)!=""){
        if($counter == 3){
            $key = $data;
            $song['slides'][$key] = "";
        }else if($counter > 3){
            $song['slides'][$key] = $song['slides'][$key]."&quot;".substr($data,0,-2)."&quot;,";
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
echo "<pre>";
print_r($song);
echo "</pre>";
?>