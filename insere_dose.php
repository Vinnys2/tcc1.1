<?php session_start(); ?>
<!DOCTYPE html>
<html lang = "pt-BR">
	<head>
		<meta charset = "UTF-8" />
		<title></title>
		<link rel="stylesheet" href="estilo.css"/>
	</head>
	<body>
<?php
	include("menu.php");
	
	include("conexao.php");
	
	$cpf = $_SESSION["autorizado"];
	
	$lote = $_POST["lote"];
	$data_tomada = date('Y/m/d');
	$local = $_POST["local"];
	$aplicador = $cpf;
	$cpf_paciente = $_POST["cpf_paciente"];
	
	$insercao = "INSERT INTO dose (lote, data_tomada, local, aplicador, cpf_paciente)
						VALUES (
								'$lote',
								'$data_tomada',
								'$local',
								'$aplicador',
								'$cpf_paciente'
								)";
	mysqli_error($conexao);
	mysqli_query($conexao, $insercao)
		or die(mysqli_error($conexao));
	
	/* function validaCPF($cpf){  ---> Validação de cpf (pego de internet), foi retirado pois estava spamando warnings
		$cpf = preg_replace('/[^0~9]/','',$cpf);
		
		$digitoA = 0;
		$digitoB = 0;
		
		for($i = 0, $x = 10; $i <= 8; $i++, $x--){
			$digitoA += $cpf[$i] * $x;
		}
		
		for($i = 0, $x = 11; $i <= 9; $i++, $x--){
			
			if(str_repeat($i, 11) == $cpf){
				return false;
			}
			
			$digitoB += $cpf[$i] * $x;
		}
		
		$somaA = (($digitoA%11) < 2 ) ? 0 : 11-($digitoA%11);
		$somaB = (($digitoB%11) < 2 ) ? 0 : 11-($digitoB%11);
		
	
		if($somaA != $cpf[9] || $somaB != $cpf[10]){
			return false;
		}else{
			return true;
		}
	}
	if(validaCPF('123')){
		echo 'CPF Válido';
	}else{
		echo 'Inválido';
	}
	
	*/
		
	echo "<script language=javascript>alert( 'Dose aplicada com sucesso!' );</script>";
	header( "refresh:0.1;url=dose.php" );
	

?>

	<body>
</html>