<?php

	include_once './DB_Functions.php';

	//Create Object for DB_Functions clas
	$db = new DB_Functions();

	return $db->find_nearest_store($_POST['latitude'], $_POST['longitude'], $_POST['category_id']);
	
?>