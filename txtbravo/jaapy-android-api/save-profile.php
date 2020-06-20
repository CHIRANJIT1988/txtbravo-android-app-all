<?php

	include_once './DB_Functions.php';

	// check for required fields
	if (isset($_POST['user_id']) && isset($_POST['name'])) 
	{
		
		$user_id 	= $_POST['user_id'];
		$name 	= $_POST['name'];
    
		//Create Object for DB_Functions class
		$db = new DB_Functions();

		echo $db->update_user($user_id, $name);
	}
	
?>