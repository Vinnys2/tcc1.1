<?php
include_once "conexao.php";

//consultar no banco de dados

//consulta próximas doses do usuário logado
$cpf= $_SESSION["autorizado"];

//consultando dependentes
$result_dependentes = "SELECT * FROM paciente WHERE cpf_responsavel = $cpf";
$resultado_dependentes = mysqli_query($conexao, $result_dependentes);


while($row_dep = mysqli_fetch_assoc($resultado_dependentes)){
	$cpf_dep = $row_dep['cpf'];
	$nome_dep = $row_dep['nome'];
	$result_prox_dep = "SELECT * FROM agendamento  
						INNER JOIN vacina ON vacina.id_vacina = agendamento.tipo_vacina
						WHERE cpf_paciente = $cpf_dep ORDER BY data_agendada DESC ";
	$resultado_prox_dep = mysqli_query($conexao, $result_prox_dep);
	
	$result_dose_dep = "SELECT * FROM dose 
						INNER JOIN lote ON lote.id = dose.lote 
						INNER JOIN paciente ON paciente.cpf = dose.aplicador 
						INNER JOIN local ON local.id_postinho = dose.local
						INNER JOIN vacina ON  vacina.id_vacina = lote.tipo_vacina 
						WHERE cpf_paciente = $cpf_dep AND cpf != $cpf 
						ORDER BY data_tomada DESC ";
	$resultado_dose_dep = mysqli_query($conexao, $result_dose_dep);
	
//Próximas vacinas de dependentes	
echo "<div id='label1'><h1 align='center'> $nome_dep </h1>";
echo"<h2 align='left'> Próximas vacinas </h2>";
if(($resultado_prox_dep) AND ($resultado_prox_dep->num_rows != 0)){
	
	echo"
	<div class=container><table style='width: 1% !important;' class='table table-hover'>
	<thead>
		<tr> 
			<td> Dose</td> 
			<td> Data de agendamento </td>  
		</tr>
	</thead>";
	while($row_prox = mysqli_fetch_assoc($resultado_prox_dep)){
		echo "<tbody><tr><td>";
		echo $row_prox['tipo'] . "</td><br><td>";
		echo $row_prox['data_agendada'] . "</td>";
		echo "</tr></tbody>";
	}
	echo "</table></div>";
	}else{
		echo "Nenhum agendamento encontrado";
	}
		
//CARTEIRINHA DEPENDENTE
	
	echo"<h2 align='left'> Carteirinha </h2>";
	if(($resultado_dose_dep) AND ($resultado_dose_dep->num_rows != 0)){
	echo"
	<div class=container-fluid><table class='table table-hover'>
	<thead>
		<tr> 
			<td> Dose </td> 
			<td> Número da Dose </td> 
			<td> Lote </td> 
			<td> Data da Aplicação </td>  
			<td> Local </td>  
			<td> Aplicador </td>  
		</tr>
	<thead>";
	while($row_dose_dep = mysqli_fetch_assoc($resultado_dose_dep)){
		echo "<tbody><tr><td>";
		echo $row_dose_dep['tipo'] . "</td><td>";
		echo $row_dose_dep['id_dose'] . "</td><td>";
		echo $row_dose_dep['lote'] . "</td><td>";
		echo $row_dose_dep['data_tomada'] . "</td><td>";
		echo $row_dose_dep['nome_postinho'] . "</td><td>";
		echo $row_dose_dep['nome'] . "</td>";
		echo "</tr></tbody>";
	}
	echo "</table></div></div><br/><br/><br/>";
	}else{
	echo "<br />Nenhuma dose  encontrada";
}
}
