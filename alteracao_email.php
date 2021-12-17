<?php
	$id = filter_input(INPUT_GET, "id");
	$email = filter_input(INPUT_GET, "email");
	
	$link = mysqli_connect("localhost", "root", "", "tcc");
	if($link){
		echo $id;

		$query = mysqli_query($link, "UPDATE paciente SET email='$email'
															WHERE cpf='$id';");
		if($query){
			echo "<script language=javascript>alert( 'Alteração  realizada com sucesso!' );</script>";
			header( "refresh:0.1s;url=perfil.php" );
		}else{
			die("Erro: ". mysqli_error($link));
		}
	}else{
		die("Erro: " . mysqli_error($link));
	}
?>