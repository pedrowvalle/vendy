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
        <link rel="stylesheet" href="../css/style_estoquista.css">
		<c:import url="../bootstrap_head.jsp"/>
        <title>Alterar Produtos</title>
    </head>
		<body>
			<!-- Importação da barra de menus -->
	    	<c:import url="../Menu.jsp"/>
	    	
	    	<div id="main" class="container">
	    		<br>
	    		<h3 class="page-header">Alterar Produtos</h3>
	    		<hr>
	    		<form action="../AlterarProdutoConsulta" method="get">
	    			<div class="row">
	    				<div class="form-group md-col-6 mx-auto">
	    					<label for="cod_produto">Digite o código do produto: </label>
	    					<input type="text" class="form-control" id="cod_produto" name="cod_produto" placeholder="Código">
	    				</div>
	    			</div>
	    			<hr>
	    			<div class="row">
	    				<div id="actions" class="col-md-6 align-self-center">
							<button type="submit" class="btn btn-primary custom" name="acao" value="Criar">Consultar</button>
							<a href="produtos/alteracao_produto_formulario.jsp" class="btn btn-default custom">Cancelar</a>
						</div>
	    			</div>
	    		</form>
	    		<form action="../ListarProdutos" method="get">
					<button type="submit" class="btn btn-primary custom float-right" name="acao"
					value="listar">Listar Produtos</button>
				</form>
	    	</div>
	    	<c:import url="../bootstrap_body.jsp"/>
		</body>
</html>