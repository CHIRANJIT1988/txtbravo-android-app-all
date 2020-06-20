<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

if (isset($_GET["regId"]) && isset($_GET["message"])) {
    $regId = $_GET["regId"];
    $message = $_GET["message"];
    
    include_once './DB_Functions.php';
    

    $gcm = new DB_Functions();


    $registatoin_ids = array($regId);
    $message = array("price" => $message);

    $result = $gcm->send_push_notification($registatoin_ids, $message);

 echo $result;

header('Location: track.php');
}
?>
