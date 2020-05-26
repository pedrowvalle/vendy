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
        <title>Alterar Operador</title>
    </head>
    <body>
    	<!-- Importação da barra de menus -->
    	<c:import url="../Menu.jsp"/>
		<br>
		<!-- Inicio do container principal -->
        <div id="main" class="container">
        	<br>
            <h3 class="page-header">Alterar Operador</h3>
            <hr>
				<form action="controller.do" method="GET">
                <div class="row">
                    <div class="form-group col-md-6 mx-auto">
                        <label for="nome_cliente">Nome do Operador:</label>
                        <input type="text" class="form-control" id="nome_operador" name="nome_operador" placeholder="Digite o nome do operador"value="${empregado.nome}">
                    </div>
                    <div class="form-group col-md-6 mx-auto">
                        <label for="cpf_cliente">CPF: </label>
                        <input type="text" class="form-control" id="cpf_operador" name="cpf_operador" placeholder="Apenas numeros"value="${empregado.cpf}">
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6">
	                    <label for="dt_nsc">Data de Nascimento: </label>
                        <input type="text" class="form-control" id="dt_nsc" name="dt_nsc" placeholder="Formato 'DD/MM/AAAA'"value="${empregado.dt_nsc}">
                    </div>
                    <div class="col-md-3 align-self-center text-center">
                    	<h4>Gênero: </h4>
                    </div>
					<div class="form-group col-md-3" style="margin-top:30px;">
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="radio" name="genero" id="genero" value="Masculino">
						  <label class="form-check-label" for="genero">Masculino</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="radio" name="genero" id="genero" value="Feminino">
						  <label class="form-check-label" for="inlineRadio2">Feminino</label>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-md-4">
						<label for="cpf_cliente">Usuário: </label>
                        <input type="text" class="form-control" id="usuario" name="usuario" placeholder=""value="${empregado.usuario}">
					</div>
					<div class="form-group col-md-4">
						<label for="cpf_cliente">Senha: </label>
                        <input type="password" class="form-control" id="senha" name="senha" placeholder=""value="${empregado.senha}">
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
                		<button type="submit" class="btn btn-primary custom" name="command" value="AlterarOperador">Cadastrar</button>
						<a href="operadores/alteracao_operadores.jsp" class="btn btn-default custom">Cancelar</a>
					</div>
                </div>
            </form>
           	
			<hr>
       		<form action="controller.do" method="get">
       			<div class="row">
					<div class="form-group col-md-6">
						<label for="cod_produto">Para confirmar a exclusão do Operador, confirme o CPF:</label>
						<input type="text" class="form-control" id="cpf_operador_del" name="cpf_operador_del" placeholder="Esta ação não pode ser desfeita">
					</div>
					<div class="col-md-6 align-self-end custom">
						<button type="submit" class="btn btn-danger" name="command" value="ExcluirOperador">Apagar Operador</button>
					</div>
				</div>
			</form>
           	</div>
		<c:import url="../bootstrap_body.jsp"/>
	</body>
</html>