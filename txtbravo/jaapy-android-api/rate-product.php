<?php

	include_once './DB_Functions.php';

	// check for required fields
	if (isset($_POST['order_no']) && isset($_POST['rating']))
	{	
		
		$order_no = $_POST['order_no'];
		$rating = $_POST['rating'];
    
			
		//Create Object for DB_Functions clas
		$db = new DB_Functions();

		echo $db->rate_product($order_no, $rating);
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