<?php

	include_once './DB_Functions.php';

	//Create Object for DB_Functions clas
	$db = new DB_Functions(); 
	
	//Get JSON posted by Android Application
	$json = $_POST["responseJSON"];
	$user = $_POST["user"];
	
	echo $db->save_store_support_message($json, $user);
	
?>