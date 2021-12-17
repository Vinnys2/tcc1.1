<?php
	$id = filter_input(INPUT_GET, "id");
	
	
	$link = mysqli_connect("localhost", "root", "", "tcc");
	if($link){
	//	echo $id;

		$query = mysqli_query($link, "DELETE FROM lote WHERE id='$id';");
		if($query){
			echo "<script language=javascript>alert( 'Lote removido com sucesso!' );</script>";
			header( "refresh:0.5;url=lote.php" );
		}else{
			die("Erro: ". mysqli_error($link));
		}
	}else{
		die("Erro: " . mysqli_error($link));
	}
?>