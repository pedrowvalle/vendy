v<%@ page language="java" contentType="text/html; charset=UTF-8"
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
            <h3 class="page-header">Cadastro de Operadores</h3>
            <hr>
            <form action="../ManterOperador" method="GET">
                <div class="row">
                    <div class="form-group col-md-6 mx-auto">
                        <label for="nome_cliente">Nome do Operador:</label>
                        <input type="text" class="form-control" id="nome_operador" name="nome_operador" placeholder="Digite o nome do operador">
                    </div>
                    <div class="form-group col-md-6 mx-auto">
                        <label for="cpf_cliente">CPF: </label>
                        <input type="number" class="form-control" id="cpf_operador" name="cpf_operador" placeholder="Apenas numeros">
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6">
	                    <label for="dt_nsc">Data de Nascimento: </label>
                        <input type="text" class="form-control" id="dt_nsc" name="dt_nsc" placeholder="Formato 'DD/MM/AAAA'">
                    </div>
                    <div class="col-md-3 align-self-center text-center">
                    	<h4>Gênero: </h4>
                    </div>
					<div class="form-group col-md-3" style="margin-top:30px;">
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="radio" name="genero" id="genero" value="m">
						  <label class="form-check-label" for="genero">Masculino</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="radio" name="genero" id="genero" value="f">
						  <label class="form-check-label" for="inlineRadio2">Feminino</label>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-md-4">
						<label for="cpf_cliente">Usuário: </label>
                        <input type="text" class="form-control" id="usuario" name="usuario" placeholder="">
					</div>
					<div class="form-group col-md-4">
						<label for="cpf_cliente">Senha: </label>
                        <input type="password" class="form-control" id="senha" name="senha" placeholder="">
					</div>
					<div class="form-group col-md-4">
	                    <label for="categoria">Selecione tipo do operador</label>
		                    <select class="form-control" id="tipo" name="tipo">
		                        <option>Operador</option>
		                        <option>Estoquista</option>
		                    </select>
                    </div>
				</div>
                <hr>
                <div class="row">
                	<div id="actions" class="col-md-6 align-self-center">
						<button type="submit" class="btn btn-primary custom" name="acao" value="incluir">Cadastrar</button>
						<a href="cadastro_produtos.jsp" class="btn btn-default custom">Cancelar</a>
					</div>
                </div>
            </form>
        </div>
		<c:import url="../bootstrap_body.jsp"/>
	</body>
</html>