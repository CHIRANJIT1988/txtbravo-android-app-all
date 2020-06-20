<?php

	include_once './DB_Functions.php';

	
	// check for required fields
	if (isset($_POST['phone_no']) && isset($_POST['password'])) 
	{

		$mobile_no 	= $_POST['phone_no'];
		$reg_id 	= $_POST['reg_id'];
		$password 	= $_POST['password'];
		$device_id 	= $_POST['device_id'];
    
			
		//Create Object for DB_Functions class
		$db = new DB_Functions();

		echo $db->login_admin($mobile_no, $device_id, $reg_id, $password);
	}

	else 
	{
		
		// required field is missing
		$response["error_code"] = 500;
		$response["message"] = "Required field(s) is missing";
		
		// echoing JSON response
		echo json_encode($response);
	}
		
?>