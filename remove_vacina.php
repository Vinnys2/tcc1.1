<?php
	$id = filter_input(INPUT_GET, "id_vacina");
	
	$link = mysqli_connect("localhost", "root", "", "tcc");
	if($link){
		echo $id;

		$query = mysqli_query($link, "DELETE FROM vacina WHERE id_vacina='$id';");
		if($query){
			echo "<script language=javascript>alert( 'Vacina removida com sucesso!' );</script>";
				header( "refresh:0.1;url=vacina.php" );
		}else{
			die("Erro: ". mysqli_error($link)); // Retorna uma string descrevendo o ultimo erro
		}
	}else{
		die("Erro: " . mysqli_error($link));
	}