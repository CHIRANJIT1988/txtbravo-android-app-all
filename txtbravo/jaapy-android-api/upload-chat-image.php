<?php
    
	include_once './DB_Functions.php';
	
	error_reporting(E_ALL);

	
	if(isset($_POST['ImageName']))
	{
	
		// array for JSON response
		$response = array();
		
		$id = $_POST['id'];
		$imgname = $_POST['ImageName'];
		$imsrc = base64_decode($_POST['base64']);
		
		
		$file = "chat-images";

		if (!file_exists($file)) 
		{
			mkdir($file);
		} 
	
	
		$fp = fopen($file."/".$imgname, 'w');

		
		fwrite($fp, $imsrc);

		if(fclose($fp))
		{
			$response["id"] = $id;	
			$response["sync_status"] = 1;		
		}
	
		else
		{
			$response["id"] = $id;	
			$response["sync_status"] = 0;
		}
	}

	else 
	{
		$response["id"] = $id;	
		$response["sync_status"] = 0;
	}
	
	// echoing JSON response
	echo json_encode($response);
	 
?>