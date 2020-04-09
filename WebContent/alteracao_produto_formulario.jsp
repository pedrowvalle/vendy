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
        <link rel="stylesheet" href="css/style_estoquista.css">
		<c:import url="bootstrap_head.jsp"/>
        <title>Alterar Produtos</title>
    </head>
    <body>
    	<!-- Importação da barra de menus -->
    	<c:import url="Menu.jsp"/>
		<br>
		<!-- Inicio do container principal -->
        <div id="main" class="container">
        	<br>
            <h3 class="page-header">Alterar Produtos</h3>
            <hr>
				<form action="AlterarProduto" method="GET">
    				<div class="row">
    					<div class="form-group col-md-12 mx-auto">
	                        <label for="nome_produto">Código do Produto:</label>
	                        <input type="text" class="form-control" value="${produto.cod}" id="cod_produto" name="cod_produto" placeholder="Digite o nome do produto">
	                    </div>
    				</div>
                	<div class="row">
	                    <div class="form-group col-md-6 mx-auto">
	                        <label for="nome_produto">Nome do Produto:</label>
	                        <input type="text" class="form-control" value="${produto.nome}" id="nome_produto" name="nome_produto" placeholder="Digite o nome do produto">
	                    </div>
	                    <div class="form-group col-md-6 mx-auto">
	                        <label for="preco">Preço do produto</label>
	                        <input type="number" class="form-control" value="${produto.preco}" id="preco" name="preco" placeholder="Insira o preço de venda do produto">
	                    </div>
                	</div>
	                <div class="row">
	                    <div class="form-group col-md-6 mx-auto">
		                    <label for="categoria">Selecione a categoria do produto</label>
			                    <select class="form-control" value="${produto.categoria}" id="categoria" name="categoria">
			                        <option>Lanches</option>
			                        <option>Bebidas</option>
			                        <option>Cafeteria</option>
			                        <option>Sobremesas</option>
			                        <option>Padaria</option>
			                        <option>Outros</option>
			                    </select>
			              </div>
					<div class="form-group col-md-6 mx-auto">
						<label for="estoque">Digite nova quantidade do estoque</label>
						<input type="number" class="form-control" value="${produto.quantidade}" id="estoque" name="estoque" placeholder = "Quantidade inicial de estoque">
					</div>
                </div>
                <hr>
                <div class="row">
                	<div id="actions" class="col-md-6">
						<button type="submit" class="btn btn-primary" name="acao" value="Alterar">Alterar</button>
						<a href="consulta_produto.jsp" class="btn btn-default">Cancelar</a>
					</div>
                </div>
            </form>
           	<hr>
       		<form action="DeletarProduto" method="get">
       			<div class="row">
					<div class="form-group col-md-6">
						<label for="cod_produto">Para confirmar a exclusão do produto, confirme o código do produto:</label>
						<input type="text" class="form-control" id="cod_produto" name="cod_produto" placeholder="Esta ação não pode ser desfeita">
					</div>
					<div class="col-md-6 align-self-end custom">
						<button type="submit" class="btn btn-danger" name="acao"
						value="listar">Apagar Produtos</button>
					</div>
				</div>
			</form>
           	</div>
		<c:import url="bootstrap_body.jsp"/>
	</body>
</html>