<?php

	include_once './DB_Functions.php';

	//Create Object for DB_Functions clas
	$db = new DB_Functions(); 
	
	echo $db->receive_advertisement($_POST["latitude"], $_POST["longitude"]);
?>