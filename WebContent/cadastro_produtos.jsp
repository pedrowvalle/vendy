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

        <link rel="stylesheet" href="style_estoquista.css">
        
        <!-- Bootstrap CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <title>Cadastro de Produtos</title>
    </head>
    <body>
    	<!-- Importação da barra de menus -->
    	<c:import url="Menu.jsp"/>
		<br>
		<!-- Inicio do container principal -->
        <div id="main" class="container">
            <h3 class="page-header">Cadastro de Produtos</h3>
            <hr>
            <form action="ManterProduto" method="GET">
                <div class="row">
                    <div class="form-group col-md-6 mx-auto">
                        <label for="nome_produto">Nome do Produto:</label>
                        <input type="text" class="form-control" id="nome_produto" name="nome_produto" placeholder="Digite o nome do produto">
                    </div>
                    <div class="form-group col-md-6 mx-auto">
                        <label for="preco">Preço do produto</label>
                        <input type="number" class="form-control" id="preco" name="preco" placeholder="Insira o preço de venda do produto">
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6">
	                    <label for="categoria">Selecione a categoria do produto</label>
		                    <select class="form-control" id="categoria" name="categoria">
		                        <option>Lanches</option>
		                        <option>Bebidas</option>
		                        <option>Cafeteria</option>
		                        <option>Sobremesas</option>
		                        <option>Padaria</option>
		                        <option>Outros</option>
		                    </select>
                    </div>
					<div class="form-group col-md-6">
						<label for="estoque">Digite a quantidade inicial do estoque</label>
						<input type="number" class="form-control" id="estoque" name="estoque" placeholder = "Quantidade inicial de estoque">
					</div>
                </div>
                <hr>
                <div class="row">
                	<div id="actions" class="col-md-6 align-self-center">
						<button type="submit" class="btn btn-primary custom" name="acao" value="Criar">Cadastrar</button>
						<a href="cadastro_produtos.jsp" class="btn btn-default custom">Cancelar</a>
					</div>
                </div>
            </form>
        </div>


<!-- Stcipts Bootstrap -->
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </body>
</html>