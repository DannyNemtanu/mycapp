<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

		include"config.php";

		$query="SELECT * FROM student
				where studentNumber='".$_GET["id"]."'  ";
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


?>
