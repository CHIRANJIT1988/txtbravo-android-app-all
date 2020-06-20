<?php

	include_once './DB_Functions.php';

	// check for required fields
	if (isset($_POST['store_id']) && isset($_POST['is_online'])) 
	{
		
		$store_id 	= $_POST['store_id'];
		$is_online 	= $_POST['is_online'];
    
			
		//Create Object for DB_Functions class
		$db = new DB_Functions();

		echo $db->update_store_online_status($store_id, $is_online);
	}
	
?>