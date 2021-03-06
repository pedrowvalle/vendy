<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <!-- Meta tags necessÃ¡rias para o Bootstrap -->
        <meta name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta charset="UTF-8">
        <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style_estoquista.css">
		<c:import url="../bootstrap_head.jsp"/>
        <title>Cadastro de Operadores</title>
    </head>
    <body>
    	<!-- Importação da barra de menus -->
    	<c:import url="../Menu.jsp"/>
		<br>
		<!-- Inicio do container principal -->
        <div id="main" class="container">
            <h3 class="page-header">Cadastro de Empregados</h3>
            <hr>
            <form action="../controller.do" method="GET">
                <div class="row">
                    <div class="form-group col-md-6 mx-auto">
                        <label for="nome_cliente">Nome do empregado:</label>
                        <input type="text" class="form-control" id="nome_operador" name="nome_operador" placeholder="Digite o nome do empregado" onkeypress="return isNumericKey(event)" required>
                    </div>
                    <div class="form-group col-md-6 mx-auto">
                        <label for="cpf_cliente">CPF: </label>
                        <input type="text" class="form-control" id="cpf_operador" name="cpf_operador" placeholder="Ex.: 000.000.000-00" onkeypress="return isNumberKey(event)" pattern=".{14,}"   required title="Digite um cpf válido" onkeydown="javascript: fMasc( this, mCPF );" maxlength="14">
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6">
	                    <label for="dt_nsc">Data de nascimento: </label>
                        <input type="text" class="form-control" id="dt_nsc" name="dt_nsc" placeholder="Ex.: dd/mm/aaaa" onkeypress="return isNumberKey(event)" onkeydown="javascript: fMasc( this, mData );"  pattern=".{10,}"   required title="Digite uma data de nascimento válida" maxlength="10">
                    </div>
                   <div class="form-group col-md-6 mx-auto">
						<label for="genero">Gênero: </label>
						  <div class="form-group col-md-3" style="margin-top:7px;">
							<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="radio" name="genero" id="genero" value="m" required>
						  	<label class="form-check-label" for="genero">Masculino</label>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						  	<input class="form-check-input" type="radio" name="genero" id="genero" value="f" required>
						  	<label class="form-check-label" for="genero">Feminino</label>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						  	<input class="form-check-input" type="radio" name="genero" id="genero" value="o" required>
						  	<label class="form-check-label" for="genero">Outro</label>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-md-4">
						<label for="cpf_cliente">Usuário: </label>
                        <input type="text" class="form-control" id="usuario" name="usuario" placeholder="Digite o nome de usuário (min. 3 caracteres)" pattern=".{3,}"   required title="Mínimo de 3 caracteres">
					</div>
					<div class="form-group col-md-4">
						<label for="cpf_cliente">Senha: </label>
                        <input type="password" class="form-control" id="senha" name="senha" placeholder="Digite a senha (min. 3 caracteres)" pattern=".{3,}"   required title="Mínimo de 3 caracteres">
					</div>
					<div class="form-group col-md-4">
	                    <label for="categoria">Selecione o tipo do empregado</label>
		                    <select class="form-control" id="tipo" name="tipo">
		                        <option>Operador</option>
		                        <option>Estoquista</option>
		                    </select>
                    </div>
				</div>
                <hr>
                <div class="row">
                	<div id="actions" class="col-md-6 align-self-center">
						<button type="submit" class="btn btn-primary custom" name="command" value="IncluirOperador">Cadastrar</button>
						<a href="../estoquista.jsp" class="btn btn-default custom">Cancelar</a>
					</div>
                </div>
            </form>
        </div>
		<c:import url="../bootstrap_body.jsp"/>
		<script type="text/javascript" src="<%= request.getContextPath() %>/js/inputText.js"></script>
	</body>
</html>