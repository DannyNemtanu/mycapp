<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");



		include"config.php";

    $id=$_GET["news_id"];
		$news_title=$_GET["news_title"];
		$news_img=$_GET["news_img"];
		$news_detail=$_GET["news_detail"];


    $sql="update  tb_news set
          news_title='$news_title',
          news_img='$news_img',
					news_detail='$news_detail'
          where news_id='$id'
    ";
    $res=mysqli_query($conn,$sql);
    if($res){
      echo true;
    }else{
      echo false;
    }

?>
