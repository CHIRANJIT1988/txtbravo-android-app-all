<?php

	include_once './DB_Functions.php';

		
	//Create Object for DB_Functions clas
	$db = new DB_Functions();
		
	echo $db->reset_store_password($_POST['mobile_no'], $_POST['code']);
	
?>