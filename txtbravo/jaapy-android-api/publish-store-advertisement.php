<?php

	include_once './DB_Functions.php';

	//Create Object for DB_Functions clas
	$db = new DB_Functions(); 
	
	echo $db->publish_store_advertisement($_POST["json_advertisement"]);
	
	//{"message_type":"advertisement","message":"Welocme to txtBravo","file_name":"slide2.jpg"}
?>