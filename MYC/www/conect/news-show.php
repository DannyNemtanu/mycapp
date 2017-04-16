<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");



		include"config.php";

		$query="SELECT * FROM tb_news order by news_id desc ";
		$result = $conn->query($query);


		$outp = "";
    while($rs = $result->fetch_array(MYSQLI_ASSOC)) {
        if ($outp != "") {$outp .= ",";}
        $outp .= '{"news_id":"'.$rs["news_id"].'",';
  			$outp .= '"news_title":"'.$rs["news_title"].'",';
  			$outp .= '"news_img":"'.$rs["news_img"]. '"}';

    }
    $outp ='{"records":['.$outp.']}';
    $conn->close();


    echo($outp);




















?>
