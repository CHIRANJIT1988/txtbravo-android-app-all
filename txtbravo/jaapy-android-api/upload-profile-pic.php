<?php
    
	include_once './DB_Functions.php';
	
	error_reporting(E_ALL);

	
	if(isset($_POST['ImageName']))
	{
	
		// array for JSON response
		$response = array();
		
		$imgname = $_POST['ImageName'];
		$imsrc = base64_decode($_POST['base64']);
		
		
		$file = "profile-pics";

		if (!file_exists($file)) 
		{
			mkdir($file);
		} 
	
	
		$fp = fopen($file."/".$imgname, 'w');

		
		fwrite($fp, $imsrc);

		if(fclose($fp))
		{
			
			$response["sync_status"] = 1;		
		}
	
		else
		{
			
			$response["sync_status"] = 0;
		}
	}

	else 
	{
		
		$response["sync_status"] = 0;
	}
	
	// echoing JSON response
	echo json_encode($response);
	 
?>