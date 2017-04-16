<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");


if(isset($_GET["username"]) && isset($_GET["password"]) ){
	if( !empty($_GET["username"])  && !empty($_GET["password"])  ){

		include"config.php";

		$username=$_GET["username"];
		$password=$_GET["password"];

    $sql="insert into student(email,pass)
          values('$username','$password')
    ";
		
    $res=mysqli_query($conn,$sql);
    if($res){
      echo true;
    }else{
      echo false;
    }
	}
}

?>
