<?php
	$id = filter_input(INPUT_GET, "cpf");
	
	$link = mysqli_connect("localhost", "root", "", "tcc");
	if($link){
		//echo $id;

		$query = mysqli_query($link, "DELETE FROM paciente WHERE cpf='$id';");
		if($query){
			header("location:paciente.php");
		}else{
			echo "Ops, Administradores não podem ser apagados!!!";
			 header( "refresh:0.5;url=paciente.php" );
			
		}
	}else{
		die("Erro: " . mysqli_error($link));
	}
