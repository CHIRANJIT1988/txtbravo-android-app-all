<?php

	include_once './DB_Functions.php';

		
	//Create Object for DB_Functions clas
	$db = new DB_Functions();
		
	echo $db->change_store_password($_POST['responseJSON'], $_POST['store']);
	
?>