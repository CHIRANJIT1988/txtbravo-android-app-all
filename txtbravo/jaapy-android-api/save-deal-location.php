<?php

	include_once './DB_Functions.php';

	// check for required fields
	if (isset($_POST['user_id']) && isset($_POST['latitude']) && isset($_POST['longitude'])) 
	{
		
		$user_id 	= $_POST['user_id'];
		$latitude 	= $_POST['latitude'];
		$longitude 	= $_POST['longitude'];
    
			
		//Create Object for DB_Functions class
		$db = new DB_Functions();

		echo $db->update_deal_location($user_id, $latitude, $longitude);
	}
	
?>