<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");



		include"config.php";

		$query="SELECT * FROM tb_news
				where news_id='".$_GET["id"]."'  ";
		$result = $conn->query($query);

        $outp = "";

		if( $rs=$result->fetch_array()) {
			if ($outp != "") {$outp .= ",";}
			$outp .= '{"news_id":"'  . $rs["news_id"] . '",';
			$outp .= '"news_title":"'   . $rs["news_title"]        . '",';
			$outp .= '"news_detail":"'   . $rs["news_detail"]        . '",';
			$outp .= '"news_img":"'. $rs["news_img"]     . '"}';
		}
		$outp ='{"records":'.$outp.'}';
		$conn->close();

		echo($outp);


?>
