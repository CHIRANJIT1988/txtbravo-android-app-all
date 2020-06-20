<?php

	include_once './DB_Functions.php';

	// check for required fields
	if (isset($_POST['mobile_no']) && isset($_POST['code'])) 
	{

		//Create Object for DB_Functions class
		$db = new DB_Functions();
		
		
		// array for JSON response
		$response = array();	
		
		$mobile_no = Security::decrypt($_POST['mobile_no'], SECRET_KEY);
		$code = Security::decrypt($_POST['code'], SECRET_KEY);
		
		$db->send_sms($mobile_no, "Thank you for using txtBravo. Your OTP for registration is ".$code);
		
		$response["error_code"] = 100;
		$response["message"] = "Success";
	}

	else 
	{
		// required field is missing
		$response["error_code"] = 500;
		$response["message"] = "Required field(s) is missing";
	}
		

	// echoing JSON response
	echo json_encode($response);
	
?>