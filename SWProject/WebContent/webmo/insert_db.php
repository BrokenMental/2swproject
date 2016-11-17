<?php
	date_default_timezone_set('Asia/Seoul');

	//$url = "http://" . $_SERVER["HTTP_HOST"].$_SERVER["REQUEST_URI"];
	$today = date("Y-m-d");
	$con = mysqli_connect("localhost", "root", "1234", "swproject");
	$sql = "Insert INTO memo (text, today, url)
			VALUES ('$_POST[text]', '$today', '$_POST[url]')";
	
	if(mysqli_query($con, $sql)){
		echo "저장되었습니다.";
		//echo "<a href='http://localhost:8080/SWProject/Main.jsp'>홈페이지로 이동</a>";
		//어떻게 해야하지
	}else{
		echo "Error:" . mysqli_error($con);
	}
	
?>