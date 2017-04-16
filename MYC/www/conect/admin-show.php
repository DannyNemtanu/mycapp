<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

		include"config.php";

		$query="SELECT * FROM student  ";
		$result = $conn->query($query);


		$outp = "";
    while($rs = $result->fetch_array(MYSQLI_ASSOC)) {
        if ($outp != "") {$outp .= ",";}
        $outp .= '{"studentNumber":"'.$rs["studentNumber"].'",';
  			$outp .= '"email":"'.$rs["email"].'",';
  			$outp .= '"pass":"'.$rs["pass"]. '"}';
    }
    $outp ='{"records":['.$outp.']}';
    $conn->close();

    echo($outp);

?>
