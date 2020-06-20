<?php

	include_once './DB_Functions.php';

	//Create Object for DB_Functions clas
	$db = new DB_Functions(); 
	
	echo $db->publish_user_advertisement($_POST["json_advertisement"]);
	
	//{"message_type":"advertisement","message":"Welocme to txtBravo","file_name":"slide2.jpg","store_id":"0","store_name":"Support Team !!","category_id":"0","rating":"5","timestamp":"2016-05-06 19:42:37"}
?>