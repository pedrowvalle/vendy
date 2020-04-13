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
        <title>Alterar Clientes</title>
    </head>
    <body>
    	<!-- Importação da barra de menus -->
    	<c:import url="../Menu.jsp"/>
		<br>
		<!-- Inicio do container principal -->
        <div id="main" class="container">
        	<br>
            <h3 class="page-header">Alterar Clientes</h3>
            <hr>
				<form action="AlterarCliente" method="GET">
    				<div class="row">
    					<div class="form-group col-md-12 mx-auto">
	                        <label for="nome_produto">CPF:</label>
	                        <input type="text" class="form-control" value="${cliente.cpf}" id="cpf_cliente" name="cpf_cliente" placeholder="Somente números">
	                    </div>
    				</div>
                	<div class="row">
	                    <div class="form-group col-md-6 mx-auto">
	                        <label for="nome_produto">Nome do Cliente:</label>
	                        <input type="text" class="form-control" value="${cliente.nome}" id="nome_cliente" name="nome_cliente" placeholder="Digite o nome do cliente">
	                    </div>
	                    <div class="form-group col-md-6 mx-auto">
	                        <label for="preco">Data de Nascimento</label>
	                        <input type="number" class="form-control" value="${cliente.datan}" id="datan" name="datan" placeholder="Formato 'DD/MM/AAAA'">
	                    </div>
                	</div>
	                <div class="row">
	                    <div class="col-md-3 align-self-center text-center">
                    	<h4>Gênero: </h4>
                    </div>
					<div class="form-group col-md-3" style="margin-top:30px; margin-left:auto">
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
                	<div id="actions" class="col-md-6">
						<button type="submit" class="btn btn-primary" name="acao" value="Alterar">Alterar</button>
						<a href="consulta_cliente.jsp" class="btn btn-default">Cancelar</a>
					</div>
                </div>
            </form>
           	<hr>
       		<form action="DeletarCliente" method="get">
       			<div class="row">
					<div class="form-group col-md-6">
						<label for="cod_produto">Para confirmar a exclusão do Cliente, confirme o CPF:</label>
						<input type="text" class="form-control" id="cpf_cliente_del" name="cpf_cliente_del" placeholder="Esta ação não pode ser desfeita">
					</div>
					<div class="col-md-6 align-self-end custom">
						<button type="submit" class="btn btn-danger" name="acao"
						value="listar">Apagar Cliente</button>
					</div>
				</div>
			</form>
           	</div>
		<c:import url="../bootstrap_body.jsp"/>
	</body>
</html>