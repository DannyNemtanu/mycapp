<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

if(isset($_GET["username"]) && isset($_GET["password"]) ){
	if( !empty($_GET["username"])  && !empty($_GET["password"])  ){

		include"config.php";

		$username=$_GET["username"];
		$password=$_GET["password"];

		$query="SELECT * FROM `Student`
				where `email`='".$_GET["username"]."' and `pass`='".$_GET["password"]."'  ";
		//$query="SELECT * FROM `Student` WHERE `email` = 'adm' AND `pass` = 'adm'
        
        
        $result = $conn->query($query);

    $outp = "";
		if( $rs=$result->fetch_array()) {
			if ($outp != "") {$outp .= ",";}
			$outp .= '{"studentNumber":"'  . $rs["studentNumber"] . '",';
			$outp .= '"email":"'   . $rs["email"]        . '",';
			$outp .= '"pass":"'. $rs["pass"]     . '"}';
		}
		$outp ='{"records":'.$outp.'}';
		$conn->close();

		echo($outp);
	}
}
?>
