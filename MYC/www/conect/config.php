<?php
		//$conn = new mysqli("localhost", "root", "password", "thepanthers");
//$conn = new PDO("sqlsrv:Server=YouAddress;Database=YourDatabase", "Username", "Password");
		try {
    $conn = new PDO("sqlsrv:server = tcp:thepanthersnci.database.windows.net,1433; Database = thepanthers", "thepanthersnci", "£Qwer1234");
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
}
catch (PDOException $e) {
    print("Error connecting to SQL Server.");
    die(print_r($e));
}

// SQL Server Extension Sample Code:
$connectionInfo = array("UID" => "thepanthersnci@thepanthersnci", "pwd" => "£Qwer1234", "Database" => "thepanthers", "LoginTimeout" => 30, "Encrypt" => 1, "TrustServerCertificate" => 0);
$serverName = "tcp:thepanthersnci.database.windows.net,1433";
$conn = sqlsrv_connect($serverName, $connectionInfo);
 ?>

 ?>
