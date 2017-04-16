<?php
		//$conn = new mysqli("mysql2493.cp.blacknight.com", "u1009676_myc", "Qwert12345&", "db1009676_thepanthers");



error_reporting(~E_DEPRECATED & ~E_NOTICE);
define('DBHOST', 'mysql2493.cp.blacknight.com');
define('DBUSER', 'u1009676_myc');
define('DBPASS', 'Qwert12345&');
define('DBNAME', 'db1009676_thepanthers');

$conn = mysqli_connect(DBHOST, DBUSER, DBPASS);
$dbcon = mysqli_select_db($conn, DBNAME);

if (!$conn) {
    die("Connection failed : " . mysqli_error());
}

if (!$dbcon) {
    die("Database Connection failed : " . mysqli_error());
}


 ?>
