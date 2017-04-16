<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

		include"config.php";

    $id=$_GET["id"];
		$username=$_GET["user"];
		$password=$_GET["password"];

    $sql="update  student set
          email='$username',
          pass='$password'

          where studentNumber='$id'
    ";
    $res=mysqli_query($conn,$sql);
    if($res){
      echo true;
    }else{
      echo false;
    }

?>
