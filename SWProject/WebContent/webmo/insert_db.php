<?php
	date_default_timezone_set ( 'Asia/Seoul' );

	$today = date ( "Y-m-d" );
	$db_host = "localhost";
	$db_user = "root";
	$db_passwd = "1234";
	$db_name = "2swproject";
	$conn = mysqli_connect ( $db_host, $db_user, $db_passwd, $db_name );

	$sql = "Insert INTO memo (text, today, url)
	VALUES ('text', '$today', 'url')";

	if (mysqli_query ( $conn, $sql )) {
		echo 'Success!';
	} else {
		echo 'Error:' . mysqli_error ( $conn );
	}
?>