<?php

class DB_Functions 
{

    private $db;

    // put your code here
    // constructor
    function __construct() 
	{
        
		include_once './DbConnect.php';
		include_once './security.php';
		
        // connecting to database
        $this->db = new DbConnect();
        $this->db->connect();
    }

    // destructor
    function __destruct() 
	{
        
    }
	
	
	
	public function save_user_support_message($data, $user_id)
	{
		
		$api_key = $this->find_admin_user_api_key(Security::decrypt($user_id, SECRET_KEY));
		$json = Security::decrypt($data, $api_key);
	
	
		//Remove Slashes
		if (get_magic_quotes_gpc())
		{
			$json = stripslashes($json);
		}

		//Decode JSON into an Array
		$data = json_decode($json);
		
		
		$a=array();
		$b=array();
	
		for($i=0; $i<count($data); $i++)
		{		
	
			$message_id = $data[$i]->message_id;
			$sender_id = $data[$i]->sender_id;
			$recipient_id = $data[$i]->recipient_id;
			$message = $data[$i]->message;
			$image = $data[$i]->image;
			$timestamp = $data[$i]->timestamp;
			$sender_name = $data[$i]->sender_name;
			
			$message = !empty($message) ? "'$message'" : "NULL";
			$image = !empty($image) ? "'$image'" : "NULL";
			
			
			$result = mysql_query("INSERT INTO `support_chat_messages`(`message_id`, `sender_id`, `recipient_id`, `message`, `file_name`, `timestamp`, `created_at`, `updated_at`) VALUES ('$message_id', (SELECT `phone_no` FROM `admin_users` WHERE `id`='$sender_id'), (SELECT `phone_no` FROM `users` WHERE `id`='$recipient_id'), $message, $image, '$timestamp', sysdate(), sysdate())");
			
			if($result) // Based on inserttion or updation create JSON response
			{
				
				$new_data = (array) $data[$i];
				$new_data["message_type"] = 'chat_message';
				
				$new_data["sender_id"] = '0';
				$new_data["image"] = '';
				$new_data["sender_name"] = 'Support Team';
				
				$push_message = json_encode($new_data);
				
				$this->push_user_chat_message($push_message, $recipient_id);
				
				
				$b["id"] = $data[$i]->id;
				$b["sync_status"] = 1;	
				array_push($a,$b);
			}
			
			else
			{
				
				if( mysql_errno() == 1062) 
				{
					$b["id"] = $data[$i]->id;
					$b["sync_status"] = 1;	
					array_push($a,$b);
				}
				
				else
				{
					$b["id"] = $data[$i]->id;
					$b["sync_status"] = 0;
					array_push($a,$b);
				}
			}
		}	

		echo json_encode($a);
	}
	
	
	
	public function save_store_support_message($data, $user_id)
	{
		
		$api_key = $this->find_admin_user_api_key(Security::decrypt($user_id, SECRET_KEY));
		$json = Security::decrypt($data, $api_key);
	
	
		//Remove Slashes
		if (get_magic_quotes_gpc())
		{
			$json = stripslashes($json);
		}

		//Decode JSON into an Array
		$data = json_decode($json);
		
		
		$a=array();
		$b=array();
	
		for($i=0; $i<count($data); $i++)
		{		
	
			$message_id = $data[$i]->message_id;
			$sender_id = $data[$i]->sender_id;
			$recipient_id = $data[$i]->recipient_id;
			$message = $data[$i]->message;
			$image = $data[$i]->image;
			$timestamp = $data[$i]->timestamp;
			$sender_name = $data[$i]->sender_name;
			
			
			$message = !empty($message) ? "'$message'" : "NULL";
			$image = !empty($image) ? "'$image'" : "NULL";
			
			
			$result = mysql_query("INSERT INTO `support_chat_messages`(`message_id`, `sender_id`, `recipient_id`, `message`, `file_name`, `timestamp`, `created_at`, `updated_at`) VALUES ('$message_id', (SELECT `phone_no` FROM `admin_users` WHERE `id`='$sender_id'), (SELECT `phone_no` FROM `stores` WHERE `id`='$recipient_id'), $message, $image, '$timestamp', sysdate(), sysdate())");
			
			if($result) // Based on inserttion or updation create JSON response
			{
				
				$new_data = (array) $data[$i];
				$new_data["message_type"] = 'chat_message';
				
				$new_data["sender_id"] = '0';
				$new_data["image"] = '';
				$new_data["sender_name"] = 'Support Team';
				
				$push_message = json_encode($new_data);
				
				$this->push_store_chat_message($push_message, $recipient_id);
				
				
				$b["id"] = $data[$i]->id;
				$b["sync_status"] = 1;	
				array_push($a,$b);
			}
			
			else
			{
				
				if( mysql_errno() == 1062) 
				{
					$b["id"] = $data[$i]->id;
					$b["sync_status"] = 1;	
					array_push($a,$b);
				}
				
				else
				{
					$b["id"] = $data[$i]->id;
					$b["sync_status"] = 0;
					array_push($a,$b);
				}
			}
		}	

		echo json_encode($a);
	}
	
	
	public function save_user_message($data, $user_id)
	{
		
		$api_key = $this->find_user_api_key(Security::decrypt($user_id, SECRET_KEY));
		$json = Security::decrypt($data, $api_key);
	
	
		//Remove Slashes
		if (get_magic_quotes_gpc())
		{
			$json = stripslashes($json);
		}

		//Decode JSON into an Array
		$data = json_decode($json);
		
		
		$a=array();
		$b=array();
	
		for($i=0; $i<count($data); $i++)
		{		
	
			$message_id = $data[$i]->message_id;
			$sender_id = $data[$i]->sender_id;
			$recipient_id = $data[$i]->recipient_id;
			$message = $data[$i]->message;
			$image = $data[$i]->image;
			$timestamp = $data[$i]->timestamp;
			$sender_name = $data[$i]->sender_name;
			
			$message = !empty($message) ? "'$message'" : "NULL";
			$image = !empty($image) ? "'$image'" : "NULL";
			
			
			if($recipient_id == 0)
			{
				
				$result = mysql_query("SELECT `id`, `phone_no` FROM `admin_users` WHERE `id`='2'");
				//$result = mysql_query("SELECT `id`, `phone_no` FROM `admin_users` ORDER BY RAND() LIMIT 1");
				
				if($result)
				{
			
					$row = mysql_num_rows($result);
					
					if($row > 0)
					{
						
						while ($row = mysql_fetch_array($result)) 
						{
							
							$phone_no = $row['phone_no'];
							$admin_recipient_id = $row['id'];
							
							$result = mysql_query("INSERT INTO `support_chat_messages`(`message_id`, `sender_id`, `recipient_id`, `message`, `file_name`, `timestamp`, `created_at`, `updated_at`) VALUES ('$message_id', (SELECT `phone_no` FROM `users` WHERE `id`='$sender_id'), '$phone_no', $message, $image, '$timestamp', sysdate(), sysdate())");
						}
					}
				}
			}
			
			else
			{
				$result = mysql_query("INSERT INTO `chat_messages`(`message_id`, `sender_id`, `recipient_id`, `message`, `file_name`, `timestamp`, `created_at`, `updated_at`) VALUES ('$message_id', (SELECT `phone_no` FROM `users` WHERE `id`='$sender_id'), (SELECT `phone_no` FROM `stores` WHERE `id`='$recipient_id'), $message, $image, '$timestamp', sysdate(), sysdate())");
			}
			
			
			if($result) // Based on inserttion or updation create JSON response
			{
				
				$new_data = (array) $data[$i];
				$new_data["message_type"] = 'chat_message';
				$new_data["sender_type"] = 'user';
				
				$push_message = json_encode($new_data);
				
				
				if($recipient_id == 0)
				{
					$this->push_support_chat_message($push_message, $admin_recipient_id);
				}
				
				else
				{
					$this->push_store_chat_message($push_message, $recipient_id);
				}
				
				
				$b["id"] = $data[$i]->id;
				$b["sync_status"] = 1;
				$b["message_id"] = $data[$i]->message_id;
				array_push($a,$b);
			}
			
			else
			{
				
				if( mysql_errno() == 1062) 
				{
					$b["id"] = $data[$i]->id;
					$b["sync_status"] = 1;
					$b["message_id"] = $data[$i]->message_id;
					array_push($a,$b);
				}
				
				else
				{
					$b["id"] = $data[$i]->id;
					$b["sync_status"] = 0;
					$b["message_id"] = $data[$i]->message_id;
					array_push($a,$b);
				}
			}
		}	

		echo json_encode($a);
	}
	
	
	public function save_store_message($data, $store_id)
	{
		
		$api_key = $this->find_store_api_key(Security::decrypt($store_id, SECRET_KEY));
		$json = Security::decrypt($data, $api_key);
	
	
		//Remove Slashes
		if (get_magic_quotes_gpc())
		{
			$json = stripslashes($json);
		}

		//Decode JSON into an Array
		$data = json_decode($json);
		
		
		$a=array();
		$b=array();
	
		for($i=0; $i<count($data); $i++)
		{		
	
			$message_id = $data[$i]->message_id;
			$sender_id = $data[$i]->sender_id;
			$recipient_id = $data[$i]->recipient_id;
			$message = $data[$i]->message;
			$image = $data[$i]->image;
			$timestamp = $data[$i]->timestamp;
			$sender_name = $data[$i]->sender_name;
			
			
			$message = !empty($message) ? "'$message'" : "NULL";
			$image = !empty($image) ? "'$image'" : "NULL";
			
			
			if($recipient_id == 0)
			{
				
				$result = mysql_query("SELECT `id`, `phone_no` FROM `admin_users` WHERE `id`='2'");
				//$result = mysql_query("SELECT `id`, `phone_no` FROM `admin_users` ORDER BY RAND() LIMIT 1");
				
				if($result)
				{
			
					$row = mysql_num_rows($result);
					
					if($row > 0)
					{
						
						while ($row = mysql_fetch_array($result)) 
						{
							
							$phone_no = $row['phone_no'];
							$admin_recipient_id = $row['id'];
							
							$result = mysql_query("INSERT INTO `support_chat_messages`(`message_id`, `sender_id`, `recipient_id`, `message`, `file_name`, `timestamp`, `created_at`, `updated_at`) VALUES ('$message_id', (SELECT `phone_no` FROM `stores` WHERE `id`='$sender_id'), '$phone_no', $message, $image, '$timestamp', sysdate(), sysdate())");
						}
					}
				}
			}
			
			else
			{
				$result = mysql_query("INSERT INTO `chat_messages`(`message_id`, `sender_id`, `recipient_id`, `message`, `file_name`, `timestamp`, `created_at`, `updated_at`) VALUES ('$message_id', (SELECT `phone_no` FROM `stores` WHERE `id`='$sender_id'), (SELECT `phone_no` FROM `users` WHERE `id`='$recipient_id'), $message, $image, '$timestamp', sysdate(), sysdate())");
			}
			
			
			if($result) // Based on inserttion or updation create JSON response
			{
				
				$new_data = (array) $data[$i];
				$new_data["message_type"] = 'chat_message';
				$new_data["sender_type"] = 'store';
				
				$push_message = json_encode($new_data);
				
				if($recipient_id == 0)
				{
					$this->push_support_chat_message($push_message, $admin_recipient_id);
				}
				
				else
				{
					$this->push_user_chat_message($push_message, $recipient_id);
				}
				
				
				$b["id"] = $data[$i]->id;
				$b["sync_status"] = 1;
				$b["message_id"] = $data[$i]->message_id;
				array_push($a,$b);
			}
			
			else
			{
				
				if( mysql_errno() == 1062) 
				{
					$b["id"] = $data[$i]->id;
					$b["sync_status"] = 1;
					$b["message_id"] = $data[$i]->message_id;
					array_push($a,$b);
				}
				
				else
				{
					$b["id"] = $data[$i]->id;
					$b["sync_status"] = 0;
					$b["message_id"] = $data[$i]->message_id;
					array_push($a,$b);
				}
			}
		}	

		echo json_encode($a);
	}
	
	
	public function find_nearest_store($latitude, $longitude, $category_id)
	{
		
		$response = array();
	
		$result = mysql_query("SELECT s.`id`, `name`, COALESCE(`owner_name`, '') AS `owner_name`, `phone_no`, `address`, `city`, `state`, `country`, `pincode`, `latitude`, `longitude`, `is_online`, `amount`, `delivery_charge`, `distance`, (SELECT COALESCE(AVG(`rating`), 0) AS `rating` FROM `orders` WHERE `store_id`=s.`id`) AS `rating`, d.`status` FROM `stores` s LEFT JOIN `delivery_details` d ON s.`id`=d.`store_id` LEFT JOIN `store_addresses` a ON s.`id`=a.`store_id` LEFT JOIN `store_categories` c ON s.`id`=c.`store_id` WHERE a.`latitude` IS NOT NULL AND a.`longitude` IS NOT NULL AND d.`status` IS NOT NULL AND c.`product_category_id`='$category_id' AND c.`status`=1");
	
	
		while($row = mysql_fetch_array($result))
		{
			
			$distance = $this->distance($row["latitude"], $row["longitude"], $latitude, $longitude, "K");
			$distance = round(number_format($distance, 1), 2);
			
			if($distance <= $row["distance"])
			{
				
				$tmp = array();
				
				$tmp["id"] = $row["id"];
				$tmp["name"] = $row["name"];
				$tmp["owner"] = $row["owner_name"];
				$tmp["phone_no"] = $row["phone_no"];
				
				$tmp["address"] = $row["address"];
				$tmp["city"] = $row["city"];
				$tmp["state"] = $row["state"];
				$tmp["country"] = $row["country"];
				$tmp["pincode"] = $row["pincode"];
				$tmp["latitude"] = $row["latitude"];
				$tmp["longitude"] = $row["longitude"];
				$tmp["distance"] = $distance;
				$tmp["is_online"] = $row["is_online"];
				
				$tmp["amount"] = $row["amount"];
				$tmp["delivery_charge"] = $row["delivery_charge"];
				$tmp["delivery_status"] = $row["status"];
				$tmp["rating"] = $row["rating"];
				
				// push bank details to final json array
				array_push($response, $tmp);
			}
		}
		
		echo json_encode($response);
	}
	
	
	
	public function save_product($data, $store_id)
	{
		
		$api_key = $this->find_store_api_key(Security::decrypt($store_id, SECRET_KEY));
		$json = Security::decrypt($data, $api_key);
	
	
		//Remove Slashes
		if (get_magic_quotes_gpc())
		{
			$json = stripslashes($json);
		}

		//Decode JSON into an Array
		$data = json_decode($json);
		
		
		$a=array();
		$b=array();
	
		for($i=0; $i<count($data); $i++)
		{		
	
			$category_id = $data[$i]->category_id;
			$sub_category_id = $data[$i]->sub_category_id;
			$product_code = $data[$i]->product_code;
			$product_name = $data[$i]->product_name;
			$product_description = $data[$i]->product_description;
			$product_image = $data[$i]->product_image;
			$price = $data[$i]->price;
			$discount_price = $data[$i]->discount_price;
			$product_weight = $data[$i]->product_weight;
			$unit = $data[$i]->unit;
			$store_id = $data[$i]->store_id;
			$status = $data[$i]->status;
			
			
			$product_description = !empty($product_description) ? "'$product_description'" : "NULL";
			$product_image = !empty($product_image) ? "'$product_image'" : "NULL";
			
			
			$result = mysql_query("INSERT INTO `products`(`product_category_id`, `product_sub_category_id`, `store_id`, `product_code`, `name`, `description`, `image`, `price`, `discount_price`, `weight`, `unit`, `created_at`, `updated_at`) VALUES ('$category_id', '$sub_category_id', '$store_id', '$product_code', '$product_name', $product_description, $product_image, '$price', '$discount_price', '$product_weight', '$unit', sysdate(), sysdate())");
			
			
			if($result) // Based on inserttion or updation create JSON response
			{
				
				$b["id"] = $data[$i]->id;
				$b["sync_status"] = 1;	
				array_push($a,$b);
			}
			
			else
			{
				
				if( mysql_errno() == 1062) 
				{
					
					$result = mysql_query("UPDATE `products` SET `product_category_id`='$category_id', `product_sub_category_id`='$sub_category_id', `name`='$product_name', `description`=$product_description, `price`='$price', `discount_price`='$discount_price', `image`=$product_image, `weight`='$product_weight', `unit`='$unit', `status`='$status' WHERE `product_code`='$product_code'");
				
					$b["id"] = $data[$i]->id;
					$b["sync_status"] = 1;	
					array_push($a,$b);
				}
				
				else
				{
					$b["id"] = $data[$i]->id;
					$b["sync_status"] = 0;
					array_push($a,$b);
				}
			}
		}	

		echo json_encode($a);
	}
	
	
	public function receive_product_category()
	{
		
		$response = array();
		
		$result = mysql_query("SELECT `id`, `name`, COALESCE(`image`, '') AS `image`, `status` FROM `product_categories` WHERE `status`=1");
	
		while($row = mysql_fetch_array($result))
		{
			
			$tmp = array();
			
			$tmp["id"] = $row["id"];
			$tmp["name"] = $row["name"];
			$tmp["image"] = $row["image"];
			$tmp["status"] = $row["status"];
		
			// push bank details to final json array
			array_push($response, $tmp);
		}
		
		echo json_encode($response);
	}
	
	
	public function receive_product_sub_category()
	{
		
		$response = array();
		
		$result = mysql_query("SELECT `id`, `product_category_id`, `name`, `status` FROM `product_sub_categories`");
	
		while($row = mysql_fetch_array($result))
		{
			
			$tmp = array();
			
			$tmp["category_id"] = $row["product_category_id"];
			$tmp["sub_category_id"] = $row["id"];
			$tmp["name"] = $row["name"];
			$tmp["status"] = $row["status"];
		
			// push bank details to final json array
			array_push($response, $tmp);
		}
		
		echo json_encode($response);
	}
	
	
	public function receive_advertisement($latitude, $longitude)
	{
		
		$response = array();
		
		$result = mysql_query("SELECT a.`store_id`, (SELECT `name` FROM `stores` WHERE `id`=a.`store_id`) AS `store_name`, `product_category_id`, `file_name`, (SELECT `latitude` FROM `store_addresses` WHERE `store_id`=a.`store_id`) AS `latitude`, (SELECT `longitude` FROM `store_addresses` WHERE `store_id`=a.`store_id`) AS `longitude`, (SELECT `adv_area_distance` FROM `delivery_details` WHERE `store_id`=a.`store_id`) AS `adv_area_distance` FROM `advertisements` a  WHERE a.`status`=1");
	
		while($row = mysql_fetch_array($result))
		{
			
			$distance = $this->distance($row["latitude"], $row["longitude"], $latitude, $longitude, "K");
			$distance = round(number_format($distance, 1), 2);
			
			if($distance <= $row["adv_area_distance"])
			{
				
				$tmp = array();
				
				$tmp["category_id"] = $row["product_category_id"];
				$tmp["store_id"] = $row["store_id"];
				$tmp["store_name"] = $row["store_name"];
				$tmp["file_name"] = $row["file_name"];
			
				// push bank details to final json array
				array_push($response, $tmp);
			}
		}
		
		echo json_encode($response);
	}
	
	
	public function receive_store_product($store_id, $category_id)
	{
		
		$response = array();
	
		$result = mysql_query("SELECT `id`, `product_category_id`, `product_sub_category_id`, `store_id`, `name`, COALESCE(`description`, '') AS `description`, COALESCE(`image`, '') AS `image`, `price`, `discount_price`, `weight`, `unit` FROM `products` WHERE `product_category_id`='$category_id' AND `store_id`='$store_id' AND `status`=1 ORDER BY `name` DESC");
	
	
		while($row = mysql_fetch_array($result))
		{
			
			$tmp = array();
			
			$tmp["product_id"] = $row["id"];
			$tmp["product_category_id"] = $row["product_category_id"];
			$tmp["product_sub_category_id"] = $row["product_sub_category_id"];
			$tmp["store_id"] = $row["store_id"];
			$tmp["product_name"] = $row["name"];
			$tmp["product_description"] = $row["description"];
			$tmp["product_image"] = $row["image"];
			$tmp["price"] = $row["price"];
			$tmp["discount_price"] = $row["discount_price"];
			$tmp["weight"] = $row["weight"];
			$tmp["unit"] = $row["unit"];
			
			// push bank details to final json array
			array_push($response, $tmp);
		}
		
		echo json_encode($response);
	}
	
	
	public function receive_all_product($store_id)
	{
		
		$response = array();
	
		$result = mysql_query("SELECT `product_code`, `product_category_id`, `product_sub_category_id`, `name`, COALESCE(`description`, '') AS `description`, COALESCE(`image`, '') AS `image`, `price`, `discount_price`, `weight`, `unit`, `status` FROM `products` WHERE `store_id`='$store_id'");
	
	
		while($row = mysql_fetch_array($result))
		{
			
			$tmp = array();
			
			$tmp["product_code"] = $row["product_code"];
			$tmp["product_category_id"] = $row["product_category_id"];
			$tmp["product_sub_category_id"] = $row["product_sub_category_id"];
			$tmp["product_name"] = $row["name"];
			$tmp["product_description"] = $row["description"];
			$tmp["product_image"] = $row["image"];
			$tmp["price"] = $row["price"];
			$tmp["discount_price"] = $row["discount_price"];
			$tmp["weight"] = $row["weight"];
			$tmp["unit"] = $row["unit"];
			$tmp["status"] = $row["status"];
			
			// push bank details to final json array
			array_push($response, $tmp);
		}
		
		echo json_encode($response);
	}
	
	
	public function delete_account($json)
	{
		
		//Remove Slashes
		if (get_magic_quotes_gpc())
		{
			$json = stripslashes($json);
		}

		//Decode JSON into an Array
		$data = json_decode($json);
		
		$user_id = $data->user_id;
		$user_key = $data->api_key;
		
		$api_key = Security::decrypt($user_key, SECRET_KEY);
		
		
		// array for JSON response
		$response = array();
		
		
		$result = mysql_query("UPDATE users SET `status`=0, `updated_at`=sysdate() WHERE `id`='$user_id' AND `api_key`='$api_key'");
			
		if($result)
		{
			
			$response["error_code"] = 200;
			$response["message"] = "Account deleted successfully";
		}
		
		else
		{
			$response["error_code"] = 500;
			$response["message"] = "Unable to Delete this Account";
		}
		
		// echoing JSON response
		echo json_encode($response);
	}
	
	
	public function update_store_online_status($store_id, $is_online)
	{
		
		$result =  mysql_query("UPDATE `stores` SET `is_online`= '$is_online', `updated_at`=sysdate() WHERE `id`='$store_id'");
		
		if($result)
		{
			
			$response["error_code"] = 200;
			$response["message"] = "Successfully Updated";
		}
		
		else
		{
			
			$response["error_code"] = 500;
			$response["message"] = "Failed to Update";
		}
		
		echo json_encode($response);
	}
	
	
	public function update_user($user_id, $name)
	{
	
		$response=array();
		
		
		$result =  mysql_query("UPDATE users SET `name`= '$name' WHERE `id`='$user_id'");
		
		if($result)
		{
			
			$response["error_code"] = 200;
			$response["message"] = "Profile Successfully Updated";
		}
		
		else
		{
			
			$response["error_code"] = 500;
			$response["message"] = "Failed to Update Profile";
		}
		
		echo json_encode($response);
	}
	
	
	public function update_deal_location($user_id, $latitude, $longitude)
	{
	
		$response=array();
		
		
		$result =  mysql_query("UPDATE users SET `latitude`= '$latitude', `longitude`= '$longitude' WHERE `id`='$user_id'");
		
		if($result)
		{
			
			$response["error_code"] = 200;
			$response["message"] = "Offer Zone Successfully Updated";
		}
		
		else
		{
			
			$response["error_code"] = 500;
			$response["message"] = "Failed to Update Offer Zone";
		}
		
		echo json_encode($response);
	}
	
	
	
	public function receive_shipping_address($user_id)
	{
		
		$response = array();
	
		$result = mysql_query("SELECT `id`, `user_id`, `name`, `phone_no`, COALESCE(`landmark`, '') AS `landmark`, `address`, `city`, `state`, `country`, `pincode` FROM `shipping_addresses` WHERE `user_id`='$user_id' AND `status`=1");
	
	
		while($row = mysql_fetch_array($result))
		{
			
			// temporary array to create single bank details
			$tmp = array();
			$tmp["address_id"] = $row["id"];
			$tmp["user_id"] = $row["user_id"];
			$tmp["name"] = $row["name"];
			$tmp["phone_no"] = $row["phone_no"];
			$tmp["landmark"] = $row["landmark"];
			$tmp["address"] = $row["address"];
			$tmp["city"] = $row["city"];
			$tmp["state"] = $row["state"];
			$tmp["country"] = $row["country"];
			$tmp["pincode"] = $row["pincode"];
		
			// push bank details to final json array
			array_push($response, $tmp);
		}
		
		echo json_encode($response);
	}
	
	
	
	public function receive_orders($user_id)
	{
		
		$response = array();
	
		$result = mysql_query("SELECT `order_no`, c.`name` AS `product_category_name`, COALESCE(`image`, '') AS `image`, s.`name` AS `store_name`, s.`id` AS `store_id`, COALESCE(`rating`, 0) AS `rating`, o.`order_status`, COALESCE(o.`delivery_charge`, 0) AS `delivery_charge`, o.`created_at` FROM `orders` o LEFT JOIN `product_categories` c ON o.`product_category_id`=c.`id` LEFT JOIN `stores` s ON o.`store_id`=s.`id` WHERE `user_id`='$user_id' ORDER BY o.`updated_at` DESC");
     
	
		while($row = mysql_fetch_array($result))
		{
			
			// temporary array to create single bank details
			$tmp = array();
			$tmp["order_no"] = $row["order_no"];
			$tmp["category_name"] = $row["product_category_name"];
			$tmp["image"] = $row["image"];
			$tmp["store_id"] = $row["store_id"];
			$tmp["store_name"] = $row["store_name"];
			$tmp["order_date"] = $row["created_at"];
			$tmp["order_status"] = $row["order_status"];
			$tmp["delivery_charge"] = $row["delivery_charge"];
			$tmp["rating"] = $row["rating"];
			
			// push bank details to final json array
			array_push($response, $tmp);
		}
		
		echo json_encode($response);
	}
	
	
	public function receive_order_details($order_no)
	{
		
		$response = array();
	
		$result = mysql_query("SELECT items.`id` AS `id`, `product_id`, `product_name`, (SELECT COALESCE(`image`, '') FROM `products` WHERE id=`product_id`) AS `product_image`, `weight`, `unit`, `price`, `discount_price`, `quantity` FROM `orders` o LEFT JOIN `order_items` items ON o.`id`= items.`order_id` WHERE `order_no`='$order_no'");
     
	
		while($row = mysql_fetch_array($result))
		{
			
			// temporary array to create single bank details
			$tmp = array();
			$tmp["product_id"] = $row["product_id"];
			$tmp["product_name"] = $row["product_name"];
			$tmp["product_image"] = $row["product_image"];
			$tmp["weight"] = $row["weight"];
			$tmp["unit"] = $row["unit"];
			$tmp["price"] = $row["price"];
			$tmp["discount_price"] = $row["discount_price"];
			$tmp["quantity"] = $row["quantity"];
			
			// push bank details to final json array
			array_push($response, $tmp);
		}
		
		echo json_encode($response);
	}
	
	
	
	public function save_shipping_details($data, $user_id)
	{
		
		$api_key = $this->find_user_api_key(Security::decrypt($user_id, SECRET_KEY));
		$json = Security::decrypt($data, $api_key);
	
	
		//Remove Slashes
		if (get_magic_quotes_gpc())
		{
			$json = stripslashes($json);
		}

		//Decode JSON into an Array
		$data = json_decode($json);
		
		
		$user_id = $data->user_id;
		$name = $data->name;
		$phone_no = $data->phone_no;
		$house_no = $data->house_no;
		$address = $data->address;
		$landmark = $data->landmark;
		$state = $data->state; 	    	
		$city = $data->city; 	    	
		$pincode = $data->pincode;
		
		
		$landmark = !empty($landmark) ? "'$landmark'" : "NULL";
		
		$result = mysql_query("INSERT INTO `shipping_addresses`(`user_id`, `name`, `phone_no`, `landmark`, `address`, `city`, `state`, `pincode`, `created_at`, `updated_at`) VALUES('$user_id', '$name', '$phone_no', $landmark, '$address', '$city', '$state', '$pincode', sysdate(), sysdate())");
		
		
		if($result)
		{
			
			$address_id = $this->find_shipping_address_id($user_id);
			
			$response["address_id"] = $address_id;
			$response["error_code"] = 200;
			$response["message"] = "Address successfully saved";
		}
		
		else
		{
			
			if( mysql_errno() == 1062)
			{
				
				$address_id = $this->find_shipping_address_id($user_id);
				
				$response["address_id"] = $address_id;
				$response["error_code"] = 200;
				$response["message"] = "Address successfully saved";
			}
			
			else
			{
				$response["error_code"] = 500;
				$response["message"] = "Sorry!! Failed to save address";
			}
		}
		
		echo json_encode($response);
	}
	
	
	public function rate_product($order_no, $rating)
	{
	
	
		$result =  mysql_query("UPDATE orders SET `rating`='$rating' WHERE `order_no`='$order_no'");
		
		if($result)
		{
			$response["error_code"] = 200;
			$response["message"] = "Rated Successfully";	
		}
		
		else
		{
			$response["error_code"] = 500;
			$response["message"] = "Failed to Rate. Try Again";	
		}
		
		echo json_encode($response);
	}
	
	
	public function find_user_by_mobile_number($mobile_no)
	{
		
		$result = mysql_query("SELECT `id` FROM `users` WHERE `phone_no`='$mobile_no'");
			
		if(!$result)
		{
			return 0;
		}
			
		$row = mysql_fetch_row($result);
		$result = $row[0];
		
		return $result;
	}
	
	
	public function find_store_by_mobile_number($mobile_no)
	{
		
		$result = mysql_query("SELECT `id` FROM `stores` WHERE `phone_no`='$mobile_no'");
			
		if(!$result)
		{
			return 0;
		}
			
		$row = mysql_fetch_row($result);
		$result = $row[0];
		
		return $result;
	}
	
	
	public function find_user_api_key($user_id)
	{
		
		$result = mysql_query("SELECT `api_key` FROM `users` WHERE `id`='$user_id'");
			
		if($result)
		{
			
			$num_of_users = mysql_num_rows($result);
			
			if ($num_of_users > 0) 
			{
				
				while ($user = mysql_fetch_array($result)) 
				{
					return $user["api_key"];
				}
			}
		}
		
		return 0;
	}
	
	
	public function find_admin_user_api_key($user_id)
	{
		
		$result = mysql_query("SELECT `api_key` FROM `admin_users` WHERE `id`='$user_id'");
			
		if($result)
		{
			
			$num_of_users = mysql_num_rows($result);
			
			if ($num_of_users > 0) 
			{
				
				while ($user = mysql_fetch_array($result)) 
				{
					return $user["api_key"];
				}
			}
		}
		
		return 0;
	}
	
	
	function generate_random_string() 
	{
		
		$characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
		$charactersLength = strlen($characters);
		$randomString = '';
    
		for ($i = 0; $i < 16; $i++) 
		{
			$randomString .= $characters[rand(0, $charactersLength - 1)];
		}
		
		return $randomString;
	}
	
	
	public function register_user($name, $mobile_no, $email, $device_id, $reg_id, $password)
	{
		
		$password = md5($password);
		$api_key = $this->generate_random_string();
		$email = !empty($email) ? "'$email'" : "NULL";
		
	
		$result = mysql_query("INSERT INTO `users`(`name`, `phone_no`, `email`, `device_id`, `reg_id`, `password`, `api_key`, `created_at`, `updated_at`) VALUES ('$name', '$mobile_no', $email, '$device_id', '$reg_id', '$password', '$api_key', sysdate(), sysdate())");
	
		
		if($result)
		{
			
			$user_id = $this->find_user_by_mobile_number($mobile_no);
			
			$response["user_id"] = Security::encrypt($user_id, SECRET_KEY);
			$response["key"] = Security::encrypt($api_key, SECRET_KEY);
			$response["error_code"] = 200;
			$response["message"] = "Registration Successfull";
		}
		
		else
		{
			
			if( mysql_errno() == 1062) 
			{
				
				// Duplicate key - Primary Key Violation
				
				$result = mysql_query("UPDATE users SET `name`='$name', `reg_id`='$reg_id', `api_key`='$api_key', `device_id`='$device_id', `email`=$email, `status`='1', `updated_at`=sysdate() WHERE `phone_no`='$mobile_no'");
			
				$user_id = $this->find_user_by_mobile_number($mobile_no);
			
				$response["user_id"] = Security::encrypt($user_id, SECRET_KEY);
				$response["key"] = Security::encrypt($api_key, SECRET_KEY);
				$response["error_code"] = 200;
				$response["message"] = "Registration Successfull";
			} 
			
			else 
			{
				// For other errors
				$response["error_code"] = 500;
				$response["message"] = "Fail to Register";
			}
		}
		
		echo json_encode($response);
	}
	
	
	
	public function register_store($name, $mobile_no, $device_id, $reg_id, $password)
	{
		
		$password = md5($password);
		$api_key = $this->generate_random_string();
		
	
		$result = mysql_query("INSERT INTO `stores`(`name`, `phone_no`, `device_id`, `reg_id`, `password`, `api_key`, `created_at`, `updated_at`) VALUES ('$name', '$mobile_no', '$device_id', '$reg_id', '$password', '$api_key', sysdate(), sysdate())");
	
		
		if($result)
		{
			
			$store_id = $this->find_store_by_mobile_number($mobile_no);
			
			$response["store_id"] = Security::encrypt($store_id, SECRET_KEY);
			$response["store_name"] = Security::encrypt($name, SECRET_KEY);
			$response["key"] = Security::encrypt($api_key, SECRET_KEY);
			$response["error_code"] = 200;
			$response["message"] = "Registration Successfull";
		}
		
		else
		{
			
			if( mysql_errno() == 1062) 
			{
				
				// Duplicate key - Primary Key Violation
				
				$result = mysql_query("UPDATE stores SET `name`='$name', `reg_id`='$reg_id', `api_key`='$api_key', `device_id`='$device_id', `password`='$password', `updated_at`=sysdate() WHERE `phone_no`='$mobile_no'");
			
				$store_id = $this->find_store_by_mobile_number($mobile_no);
			
				$response["store_id"] = Security::encrypt($store_id, SECRET_KEY);
				$response["store_name"] = Security::encrypt($name, SECRET_KEY);
				$response["key"] = Security::encrypt($api_key, SECRET_KEY);
				$response["error_code"] = 200;
				$response["message"] = "Registration Successfull";
			} 
			
			else 
			{
				// For other errors
				$response["error_code"] = 500;
				$response["message"] = "Fail to Register";
			}
		}
		
		echo json_encode($response);
	}
	
	
	public function update_store_profile($data, $store_id)
	{
		
		$api_key = $this->find_store_api_key(Security::decrypt($store_id, SECRET_KEY));
		$json = Security::decrypt($data, $api_key);
	
	
		//Remove Slashes
		if (get_magic_quotes_gpc())
		{
			$json = stripslashes($json);
		}

		//Decode JSON into an Array
		$data = json_decode($json);
		
		
		$store_id = $data->store_id;
		$store_name = $data->store_name;
		$owner = $data->owner;
		$email = $data->email;
		$alternate_phone_number = $data->alternate_phone_number;
		
		
		$email = !empty($email) ? "'$email'" : "NULL";
		$alternate_phone_number = !empty($alternate_phone_number) ? "'$alternate_phone_number'" : "NULL";
		
		
		// array for JSON response
		$response = array();
		
		
		$result = mysql_query("UPDATE stores SET `name`='$store_name', `owner_name`='$owner', `alternate_phone_number`=$alternate_phone_number, `email`=$email, `updated_at`=sysdate() WHERE `id`='$store_id'");
			
		if($result)
		{
			
			$response["id"] = $store_id;
			$response["sync_status"] = 1;
		}
		
		else
		{
			$response["id"] = $store_id;
			$response["sync_status"] = 0;
		}
		
		// echoing JSON response
		echo json_encode($response);
	}
	
	
	public function add_new_deal($json)
	{
	
		//Remove Slashes
		if (get_magic_quotes_gpc())
		{
			$json = stripslashes($json);
		}
		
		//Decode JSON into an Array
		$data = json_decode($json);
		
		
		$store_id = $data->store_id;
		$category_id = $data->category_id;
		$message = $data->message;
		$file_name = $data->file_name;
		
		$file_name = !empty($file_name) ? "'$file_name'" : "NULL";
		
		
		// array for JSON response
		$response = array();
		
		$result = mysql_query("INSERT INTO `deals`(`store_id`, `product_category_id`, `message`, `file_name`, `valid_from`, `valid_upto`, `created_at`, `updated_at`) VALUES ('$store_id', '$category_id', '$message', $file_name, sysdate(), sysdate(), sysdate(), sysdate())");
		
		
		if($result)
		{
			$response["sync_status"] = 1;
		}
		
		else
		{
			
			if( mysql_errno() == 1062)
			{
				
				$response["sync_status"] = 1;
			}
			
			else
			{
				$response["sync_status"] = 0;
			}
		}
		
		// echoing JSON response
		echo json_encode($response);
	}
	
	
	public function publish_user_advertisement($message)
	{
        
		$result = mysql_query("SELECT `id` AS `user_id` FROM `users` WHERE `reg_id` IS NOT NULL");
							
		while($row = mysql_fetch_array($result))
		{
		
			$user_id=$row["user_id"];
			$this->compose_user_message($message, $user_id);
		}
	
		echo "Publish Successful";
	}
	
	
	public function publish_store_advertisement($message)
	{
        
		$result = mysql_query("SELECT `id` AS `store_id` FROM `stores` WHERE `reg_id` IS NOT NULL");
							
		while($row = mysql_fetch_array($result))
		{
		
			$store_id=$row["store_id"];
			$this->compose_store_message($message, $store_id);
		}
	
		echo "Publish Successful";
	}
	
	
	public function publish_deal($deal_id)
	{
		
		$result = mysql_query("SELECT d.`store_id`, (SELECT `latitude` FROM `store_addresses` WHERE `store_id`=d.`store_id`) AS `latitude`, (SELECT `longitude` FROM `store_addresses` WHERE `store_id`=d.`store_id`) AS `longitude`, (SELECT COALESCE(AVG(`rating`), 0) FROM `orders` WHERE `store_id`=d.`store_id`) AS `rating`, (SELECT `deals_area_distance` FROM `delivery_details` WHERE `store_id`=d.`store_id`) AS `deals_area_distance`, (SELECT `name` FROM `stores` WHERE `id`=d.`store_id`) AS `store_name`, `product_category_id`, `message`, COALESCE(`file_name`,'') AS `file_name`, `valid_upto` FROM `deals` d WHERE d.`id`='$deal_id'");
     
		while($row = mysql_fetch_array($result))
		{
        
			$result = mysql_query("SELECT `id` AS `user_id`, `latitude`, `longitude` FROM `users` WHERE `latitude` !=0 OR `longitude` != 0");
			
			while($temp_row = mysql_fetch_array($result))
			{
			
				$latitude=$temp_row["latitude"];
				$longitude=$temp_row["longitude"];
				$user_id=$temp_row["user_id"];
			
				$distance = $this->distance($row["latitude"], $row["longitude"], $latitude, $longitude, "K");
				$distance = round(number_format($distance, 1), 2);
				
				if($distance <= $row["deals_area_distance"])
				{
				
					// temporary array to create single bank details
					$response = array();
					
					$response["message_type"] = "advertisement";
					
					$response["store_id"] = $row["store_id"];
					$response["store_name"] = $row["store_name"];
					$response["rating"] = $row["rating"];
					$response["category_id"] = $row["product_category_id"];
					$response["message"] = $row["message"];
					$response["file_name"] = $row["file_name"];
					$response["timestamp"] = $row["valid_upto"];
				
					
					// keeping response header to json
					header('Content-Type: application/json');
				
					$this->compose_user_message(json_encode($response), $user_id);
				
					echo "Publish Successful";
				}
			}
		}
	}
	
	
	public function update_delivery_details($data, $store_id)
	{
		
		$api_key = $this->find_store_api_key(Security::decrypt($store_id, SECRET_KEY));
		$json = Security::decrypt($data, $api_key);
	
	
		//Remove Slashes
		if (get_magic_quotes_gpc())
		{
			$json = stripslashes($json);
		}

		//Decode JSON into an Array
		$data = json_decode($json);
		
		
		$store_id = $data->store_id;
		$amount = $data->amount;
		$delivery_charge = $data->delivery_charge;
		$delivery_status = $data->delivery_status;
		
		
		// array for JSON response
		$response = array();
		
		
		$result = mysql_query("INSERT INTO `delivery_details`(`store_id`, `amount`, `delivery_charge`, `status`, `created_at`, `updated_at`) VALUES ('$store_id', '$amount', '$delivery_charge', '$delivery_status', sysdate(), sysdate())");
		
			
		if($result)
		{
			
			$response["id"] = $store_id;
			$response["sync_status"] = 1;
		}
		
		else
		{
			
			if( mysql_errno() == 1062)
			{
				
				$result = mysql_query("UPDATE `delivery_details` SET `amount`='$amount', `delivery_charge`='$delivery_charge', `status`='$delivery_status', `updated_at`=sysdate() WHERE `store_id`='$store_id'");
		
				if($result)
				{
					$response["id"] = $store_id;
					$response["sync_status"] = 1;
				}
				
				else
				{
					$response["id"] = $store_id;
					$response["sync_status"] = 0;
				}
			}
			
			else
			{
				$response["id"] = $store_id;
				$response["sync_status"] = 0;
			}
		}
		
		// echoing JSON response
		echo json_encode($response);
	}
	
	
	
	public function update_store_address($data, $store_id)
	{
		
		$api_key = $this->find_store_api_key(Security::decrypt($store_id, SECRET_KEY));
		$json = Security::decrypt($data, $api_key);
	
	
		//Remove Slashes
		if (get_magic_quotes_gpc())
		{
			$json = stripslashes($json);
		}

		//Decode JSON into an Array
		$data = json_decode($json);
		
		
		$store_id = $data->store_id;
		$address = $data->address;
		$city = $data->city;
		$state = $data->state;
		$pincode = $data->pincode;
		$latitude = $data->latitude;
		$longitude = $data->longitude;
		
		
		// array for JSON response
		$response = array();
		
		$result = mysql_query("INSERT INTO `store_addresses`(`store_id`, `address`, `city`, `state`, `pincode`, `latitude`, `longitude`, `created_at`, `updated_at`) VALUES ('$store_id', '$address', '$city', '$state', '$pincode', '$latitude', '$longitude', sysdate(), sysdate())");
		
			
		if($result)
		{
			
			$response["id"] = $store_id;
			$response["sync_status"] = 1;
		}
		
		else
		{
			
			if( mysql_errno() == 1062)
			{
				
				$result = mysql_query("UPDATE store_addresses SET `address`='$address', `city`='$city', `state`='$state', `pincode`='$pincode', `latitude`='$latitude', `longitude`='$longitude', `updated_at`=sysdate() WHERE `store_id`='$store_id'");
		
				if($result)
				{
					$response["id"] = $store_id;
					$response["sync_status"] = 1;
				}
				
				else
				{
					$response["id"] = $store_id;
					$response["sync_status"] = 0;
				}
			}
			
			else
			{
				$response["id"] = $store_id;
				$response["sync_status"] = 0;
			}
		}
		
		// echoing JSON response
		echo json_encode($response);
	}
	
	
	public function login_admin($mobile_no, $device_id, $reg_id, $password)
	{
		
		$password = md5($password);
		
		$result =  mysql_query("SELECT * FROM `admin_users` WHERE `phone_no`='$mobile_no' AND `password`='$password'");
		
		if($result)
		{
			
			$num_rows = mysql_num_rows($result);
			
			if($num_rows != 0)
			{
				
				while ($user = mysql_fetch_array($result)) 
				{
					
					$api_key = $this->generate_random_string();
					$user_id = $user["id"];
					
					
					$response["user_id"] = Security::encrypt($user_id, SECRET_KEY);
					$response["user_name"] = Security::encrypt($user["name"], SECRET_KEY);
					$response["error_code"] = 200;
					$response["message"] = "Login Successfull";
				}
				
				
				$result = mysql_query("UPDATE `admin_users` SET `reg_id`='$reg_id', `device_id`='$device_id', `api_key`='$api_key', `updated_at`=sysdate() WHERE `id`='$user_id'");
				
				$response["key"] = Security::encrypt($api_key, SECRET_KEY);
			}
			
			else
			{
				$response["error_code"] = 500;
				$response["message"] = "Invalid user details. Try Again";
			}
		}
		
		else
		{
			$response["error_code"] = 500;
			$response["message"] = "Failed to Login";
		}
			
			
		echo json_encode($response);
	}
	
	
	
	public function login_store($mobile_no, $device_id, $reg_id, $password)
	{
		
		$password = md5($password);
		
		$result =  mysql_query("SELECT * FROM `stores` WHERE `phone_no`='$mobile_no' AND `password`='$password'");
		
		if($result)
		{
			
			$num_rows = mysql_num_rows($result);
			
			if($num_rows != 0)
			{
				
				while ($store = mysql_fetch_array($result)) 
				{
					
					$api_key = $this->generate_random_string();
					$store_id = $store["id"];
					
					
					$response["store_id"] = Security::encrypt($store_id, SECRET_KEY);
					$response["store_name"] = Security::encrypt($store["name"], SECRET_KEY);
					$response["error_code"] = 200;
					$response["message"] = "Login Successfull";
				}
				
				
				$result = mysql_query("UPDATE `stores` SET `reg_id`='$reg_id', `device_id`='$device_id', `api_key`='$api_key', `updated_at`=sysdate() WHERE `id`='$store_id'");
				
				$response["key"] = Security::encrypt($api_key, SECRET_KEY);
			}
			
			else
			{
				$response["error_code"] = 500;
				$response["message"] = "Invalid store details. Try Again";
			}
		}
		
		else
		{
			$response["error_code"] = 500;
			$response["message"] = "Failed to Login";
		}
			
			
		echo json_encode($response);
	}
	
	
	
	public function find_shipping_address_id($user_id)
	{
		
		$result = mysql_query("SELECT MAX(id) AS `address_id` FROM shipping_addresses WHERE `user_id`='$user_id'");
			
		if($result)
		{
			
			$num_of_address = mysql_num_rows($result);
			
			if ($num_of_address > 0) 
			{
				
				while ($address = mysql_fetch_array($result)) 
				{
					return $address["address_id"];
				}
			}
		}
		
		return 0;
	}
	
	
	
	public function update_order_status($data, $store_id)
	{
		
		$api_key = $this->find_store_api_key(Security::decrypt($store_id, SECRET_KEY));
		$json = Security::decrypt($data, $api_key);
	
	
		//Remove Slashes
		if (get_magic_quotes_gpc())
		{
			$json = stripslashes($json);
		}

		//Decode JSON into an Array
		$data = json_decode($json);
		
		
		$order_no = $data->order_no;
		$status = $data->order_status;
		
		
		$result = mysql_query("UPDATE `orders` SET `order_status`='$status' WHERE `order_no`='$order_no'");
		
		if($result)
		{
			$response["order_no"] = $order_no;
			$response["sync_status"] = 1;
		}
		
		else
		{
			$response["order_no"] = $order_no;
			$response["sync_status"] = 0;
		}
		
		echo json_encode($response);
	}
	
	
	public function find_store_api_key($store_id)
	{
		
		$result = mysql_query("SELECT `api_key` FROM `stores` WHERE `id`='$store_id'");
			
		if($result)
		{
			
			$num_of_users = mysql_num_rows($result);
			
			if ($num_of_users > 0) 
			{
				
				while ($user = mysql_fetch_array($result)) 
				{
					return $user["api_key"];
				}
			}
		}
		
		return 0;
	}
	
	
	
	public function reset_store_password($mobile_number, $code)
	{
		
		$mobile_number = Security::decrypt($mobile_number, SECRET_KEY);
		$code = Security::decrypt($code, SECRET_KEY);
		
		$new_password = md5($code);
		
		$result = mysql_query("UPDATE `stores` SET `password`='$new_password' WHERE `phone_no`='$mobile_number'");
				
		if($result)
		{
			$response["error_code"] = 200;
			$response["message"] = "Password Reset Successful";
		}
		
		else
		{
			$response["error_code"] = 500;
			$response["message"] = "Failed to reset password";
		}
		
		echo json_encode($response);
	}
	
	
	
	public function change_store_password($json, $store_id)
	{
		
		$store_id = Security::decrypt($store_id, SECRET_KEY);
		$api_key = $this->find_store_api_key($store_id);
		
		$json = Security::decrypt($json, $api_key);
		
		
		if (get_magic_quotes_gpc())
		{
			$json = stripslashes($json);
		}

		//Decode JSON into an Array
		$data = json_decode($json);
		
		
		$old_password = md5($data->old_password);
		$new_password = md5($data->new_password);
		
		
		$result =  mysql_query("SELECT * FROM `stores` WHERE `id`='$store_id' AND `password`='$old_password'");
		
		
		if($result)
		{
			
			$num_rows = mysql_num_rows($result);
			
			if($num_rows > 0)
			{
		
				$result = mysql_query("UPDATE `stores` SET `password`='$new_password' WHERE `id`='$store_id' AND `password`='$old_password'");
				
				if($result)
				{
					$response["error_code"] = 200;
					$response["message"] = "Password Successfully Changed";
				}
				
				else
				{
					$response["error_code"] = 500;
					$response["message"] = "Failed to change password";
				}
			}
			
			else
			{
				$response["error_code"] = 500;
				$response["message"] = "Invalid user details";
			}
		}
		
		else
		{
			$response["error_code"] = 500;
			$response["message"] = "Invalid user details";
		}
		
		echo json_encode($response);
	}
	
	
	
	public function save_order_details($data, $user_id)
	{
		
		$api_key = $this->find_user_api_key(Security::decrypt($user_id, SECRET_KEY));
		$json = Security::decrypt($data, $api_key);
	
	
		//Remove Slashes
		if (get_magic_quotes_gpc())
		{
			$json = stripslashes($json);
		}

		//Decode JSON into an Array
		$data = json_decode($json);
		
		
		$order_placed = false;
		
		
		if(count($data) > 0)
		{
			
			$order_no = $data[0]->order_no;
			$user_id = $data[0]->user_id;
			$store_id = $data[0]->store_id;
			$category_id = $data[0]->category_id;
			$shipping_id = $data[0]->shipping_id;
			$delivery_charge = $data[0]->delivery_charge;
			
			
			$result = mysql_query("INSERT INTO `orders`(`order_no`, `user_id`, `store_id`, `product_category_id`, `shipping_address_id`, `delivery_charge`, `created_at`, `updated_at`) VALUES('$order_no', '$user_id', '$store_id', '$category_id', '$shipping_id', '$delivery_charge', sysdate(), sysdate())");
			
			
			if($result || mysql_errno() == 1062)
			{
				
				for($i=0; $i<count($data); $i++)
				{
			
					$product_id = $data[$i]->product_id;
					$product_name = $data[$i]->product_name;
					$weight = $data[$i]->weight;
					$unit = $data[$i]->unit;
					$quantity = $data[$i]->quantity;
					$price = $data[$i]->price;
					$discount_price = $data[$i]->discount_price;
					
					mysql_query("INSERT INTO `order_items`(`order_id`, `product_id`, `product_name`, `weight`, `unit`, `quantity`, `price`, `discount_price`) VALUES((SELECT id FROM orders WHERE order_no='$order_no'), '$product_id', '$product_name', '$weight', '$unit', '$quantity', '$price', '$discount_price')");
			
				}
				
				
				$new_data["message_type"] = 'order';
				$new_data["user_id"] = $user_id;
				$new_data["order_no"] = $order_no;
				$new_data["delivery_charge"] = $delivery_charge;
				
				
				$result = mysql_query("SELECT `name`, `phone_no`, COALESCE(`landmark`, '') AS `landmark`, `address`, `city`, `state`, `country`, `pincode` FROM `shipping_addresses` WHERE `id`='$shipping_id'");
			
			
				while($row = mysql_fetch_array($result))
				{
					
					$new_data["customer_name"] = $row["name"];
					$new_data["phone_no"] = $row["phone_no"];
					$new_data["landmark"] = $row["landmark"];
					$new_data["address"] = $row["address"];
					$new_data["city"] = $row["city"];
					$new_data["state"] = $row["state"];
					$new_data["country"] = $row["country"];
					$new_data["pincode"] = $row["pincode"];
				}
				
				
				$push_message = json_encode($new_data);
				
				$this->compose_store_message($push_message, $store_id);
				
				$order_placed = true;
			}
		}
		
		
		if($order_placed)
		{
			$response["status_code"] = 200;
			$response["message"] = "Order Successfull";
			$response["order_no"] = $order_no;
		}
		
		else
		{
			$response["status_code"] = 500;
			$response["message"] = "Failed to Place Order. Try Again";
		}
		
		// echoing JSON response
		echo json_encode($response);
	}


	public function attach_store($data, $store_id) 
	{
	
		$api_key = $this->find_store_api_key(Security::decrypt($store_id, SECRET_KEY));
		$json = Security::decrypt($data, $api_key);
	
	
		//Remove Slashes
		if (get_magic_quotes_gpc())
		{
			$json = stripslashes($json);
		}

		//Decode JSON into an Array
		$data = json_decode($json);
		
		
		// array for JSON response
		$a = array();
		$b = array();
		
		
		for($i=0; $i<count($data); $i++)
		{
			
			$store_id = $data[$i]->store_id;
			$category_id = $data[$i]->category_id;
			$status = $data[$i]->status;
			
			$result = mysql_query("INSERT INTO `store_categories`(`store_id`, `product_category_id`, `status`, `created_at`, `updated_at`) VALUES('$store_id', '$category_id', '$status', sysdate(), sysdate())");
		
			if($result)
			{
			
				$b["id"] = $category_id;
				$b["sync_status"] = 1;	
				
				array_push($a, $b);
			}
			
			else
			{
				
				if( mysql_errno() == 1062)
				{
					
					$result = mysql_query("UPDATE `store_categories` SET `status`='$status', `updated_at`=sysdate() WHERE `store_id`='$store_id' AND `product_category_id`='$category_id'");
					
					$b["id"] = $category_id;
					$b["sync_status"] = 1;	
					
					array_push($a, $b);
				}
				
				else
				{
					
					$b["id"] = $category_id;
					$b["sync_status"] = 0;	
					
					array_push($a, $b);
				}
			}
		}
		
		echo json_encode($a);
	}
	

	function get_store_by_id($store_id) 
	{
        $result = mysql_query("SELECT reg_id FROM stores WHERE id = '$store_id' AND reg_id IS NOT NULL");
        return $result;
    }
	
	
	function get_user_by_id($user_id) 
	{
        $result = mysql_query("SELECT * FROM users WHERE id='$user_id' AND reg_id IS NOT NULL");
        return $result;
    }
	
	
	function get_admin_by_id($admin_user_id) 
	{
        $result = mysql_query("SELECT * FROM `admin_users` WHERE `id`='$admin_user_id'");
        return $result;
    }

	
	//Sending Push Notification
	function send_push_notification($registatoin_ids, $message)
	{
        
		//include_once './Config.php';
        
		// Set POST variables
        $url = 'https://android.googleapis.com/gcm/send';

        $fields = array(
            'registration_ids' => $registatoin_ids,
            'data' => $message,
        );

        $headers = array(
            'Authorization: key=' . GOOGLE_API_KEY,
            'Content-Type: application/json'
        );
		//print_r($headers);
        // Open connection
        $ch = curl_init();

        // Set the url, number of POST vars, POST data
        curl_setopt($ch, CURLOPT_URL, $url);

        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

        // Disabling SSL Certificate support temporarly
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fields));

        // Execute post
        $result = curl_exec($ch);
        if ($result === FALSE) {
            die('Curl failed: ' . curl_error($ch));
        }

        // Close connection
        curl_close($ch);
		
    }
	
	
	function sendPushNotification($gcmRegID, $pushMessage)
	{
	
		$registatoin_ids = array($gcmRegID);
		$message = array("price" => $pushMessage);
	
		$result = $this->send_push_notification($registatoin_ids, $message);
	}
	
	
	function compose_store_message($message, $store_id)
	{
	
		$resultUsers =  $this->get_store_by_id($store_id);
	
		if ($resultUsers != false)
		{
			$NumOfUsers = mysql_num_rows($resultUsers);
		}
			
		else
		{
			$NumOfUsers = 0;
		}
			
		if ($NumOfUsers > 0) 
		{
				
			while ($rowUsers = mysql_fetch_array($resultUsers)) 
			{
				
				$this->sendPushNotification($rowUsers["reg_id"], $message);
			}
		}
	}
	
	
	function compose_user_message($message, $user_id)
	{
	
		$resultUsers =  $this->get_user_by_id($user_id);
	
		if ($resultUsers != false)
		{
			$NumOfUsers = mysql_num_rows($resultUsers);
		}
			
		else
		{
			$NumOfUsers = 0;
		}
			
		if ($NumOfUsers > 0) 
		{
				
			while ($rowUsers = mysql_fetch_array($resultUsers)) 
			{
				
				$this->sendPushNotification($rowUsers["reg_id"], $message);
			}
		}
	}
	
	
	function push_user_chat_message($message, $user_id)
	{
	
		$resultUsers =  $this->get_user_by_id($user_id);
	
		if ($resultUsers != false)
		{
			$NumOfUsers = mysql_num_rows($resultUsers);
		}
			
		else
		{
			$NumOfUsers = 0;
		}
			
		if ($NumOfUsers > 0) 
		{
				
			while ($rowUsers = mysql_fetch_array($resultUsers)) 
			{
				$this->sendPushNotification($rowUsers["reg_id"], $message);
			}
		}
	}
	
	
	function push_store_chat_message($message, $store_id)
	{
	
		$resultUsers =  $this->get_store_by_id($store_id);
	
		if ($resultUsers != false)
		{
			$NumOfUsers = mysql_num_rows($resultUsers);
		}
			
		else
		{
			$NumOfUsers = 0;
		}
			
		if ($NumOfUsers > 0) 
		{
				
			while ($rowUsers = mysql_fetch_array($resultUsers)) 
			{
				$this->sendPushNotification($rowUsers["reg_id"], $message);
			}
		}
	}
	
	
	function push_support_chat_message($message, $admin_user_id)
	{
	
		$resultUsers =  $this->get_admin_by_id($admin_user_id);
	
		if ($resultUsers != false)
		{
			$NumOfUsers = mysql_num_rows($resultUsers);
		}
			
		else
		{
			$NumOfUsers = 0;
		}
			
		if ($NumOfUsers > 0) 
		{
				
			while ($rowUsers = mysql_fetch_array($resultUsers)) 
			{
				$this->sendPushNotification($rowUsers["reg_id"], $message);
			}
		}
	}
	
	
	function sendSMS($number, $message)
	{
        
		$MOBILE = $number;
        $TEXT = str_replace(' ','+',$message);

        $USER_NAME="jaapy365";
		$SENDER_NAME="JPYDLV";
		
		
        //$Password="jaapy365";
        //$Sid="DDUIET";
        //$url = "http://t.onetouchsms.in/sendsms.jsp?user=".$ID."&password=".$Password."&mobiles=".$mobile."&sms=".$Text."&senderid=".$Sid;
		//$ch=curl_init();
		//$url = "http://sms.hspsms.com:8090/sendSMS?username=jaapy365&message=Testing&sendername=JPYDLV&smstype=TRANS&numbers=9707930475&apikey=85f79bbe-878a-4643-ae6f-8c118542adb3";
        //curl_setopt($ch, CURLOPT_RETURNTRANSFER, FALSE);
        //curl_setopt($ch, CURLOPT_URL, $url);
        //curl_setopt($ch, CURLOPT_HEADER, 2);
        //curl_exec($ch);
        //curl_close($ch);
		
		
		$url = "http://sms.hspsms.com/sendSMS?username=" . $USER_NAME . "&message=" . $TEXT . "&sendername=" . $SENDER_NAME . "&smstype=TRANS&numbers=" . $MOBILE . "&apikey=85f79bbe-878a-4643-ae6f-8c118542adb3";
		file_get_contents($url);
    }
	
	
	
	function send_sms($mobileNumber, $message)
	{
        
		//Your authentication key
		$authKey = "112694AjhNfv3c57321cbf";

		//Multiple mobiles numbers separated by comma
		//$mobileNumber = "9999999";

		//Sender ID,While using route4 sender id should be 6 characters long.
		$senderId = "TXTBRO";

		//Your message to send, Add URL encoding here.
		$message = urlencode($message);

		//Define route 
		$route = "4";
		//Prepare you post parameters
		$postData = array(
			'authkey' => $authKey,
			'mobiles' => $mobileNumber,
			'message' => $message,
			'sender' => $senderId,
			'route' => $route
		);

		//API URL
		$url="https://control.msg91.com/api/sendhttp.php";

		// init the resource
		$ch = curl_init();
		curl_setopt_array($ch, array(
			CURLOPT_URL => $url,
			CURLOPT_RETURNTRANSFER => true,
			CURLOPT_POST => true,
			CURLOPT_POSTFIELDS => $postData
			//,CURLOPT_FOLLOWLOCATION => true
		));


		//Ignore SSL certificate verification
		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);


		//get response
		$output = curl_exec($ch);

		//Print error if any
		if(curl_errno($ch))
		{
			echo 'error:' . curl_error($ch);
		}

		curl_close($ch);

		//echo $output;
    }
	
	
	
	function distance($lat1, $lon1, $lat2, $lon2, $unit) 
	{

		$theta = $lon1 - $lon2;
		$dist = sin(deg2rad($lat1)) * sin(deg2rad($lat2)) +  cos(deg2rad($lat1)) * cos(deg2rad($lat2)) * cos(deg2rad($theta));
		$dist = acos($dist);
		$dist = rad2deg($dist);
		$miles = $dist * 60 * 1.1515;
		$unit = strtoupper($unit);

		if ($unit == "K") 
		{	
			return ($miles * 1.609344);
		}

		else if ($unit == "N") 
		{
			return ($miles * 0.8684);
		} 
		
		else 
		{
			return $miles;
		}
	}
}

?>