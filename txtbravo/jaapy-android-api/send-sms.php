<?php


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
	
	sendSMS("9707930475", "Testing SMS");
?>