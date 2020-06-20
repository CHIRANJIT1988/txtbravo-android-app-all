<?php

	include_once './DB_Functions.php';

	//Create Object for DB_Functions clas
	$db = new DB_Functions(); 
	
	echo $db->add_new_deal($_POST["responseJSON"]);
	
	//{"store_id":"257","category_id":"2","message":"Hii","file_name":"cdh.jpg"}
?>