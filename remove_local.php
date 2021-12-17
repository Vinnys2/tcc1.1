<?php

	$id = filter_input(INPUT_GET, "id_postinho");
	
	$link = mysqli_connect("localhost", "root", "", "tcc");
	if($link){
		//echo $id;

		$query = mysqli_query($link, "DELETE FROM local WHERE id_postinho='$id';");
		if($query){
			echo "<script language=javascript>alert( 'Local removido com sucesso!' );</script>";
			header( "refresh:0.5;url=local.php" );
		}else{
			die("Erro: ". mysqli_error($link));
		}
	}else{
		die("Erro: " . mysqli_error($link));
	}