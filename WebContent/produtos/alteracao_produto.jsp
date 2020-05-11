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
        <title>Alterar Produtos</title>
    </head>
		<body>
			<!-- Importação da barra de menus -->
	    	<c:import url="../Menu.jsp"/>
	    	
	    	<div id="main" class="container">
	    		<br>
	    		<h3 class="page-header">Alterar produtos</h3>
	    		<hr>
	    		<form action="../controller.do" method="get">
	    			<div class="row">
	    				<div class="form-group col-md-6">
	    					<label for="cod_produto">Digite o código do produto: </label>
	    					<input type="text" class="form-control" id="cod" name="cod" placeholder="Código">
	    				</div>
	    				<div class="col-md-6 align-self-end custom">
							<button type="submit" class="btn btn-primary" name="command" value="EditarProduto">Consultar</button>
							<a href="../estoquista.jsp" class="btn btn-default">Cancelar</a>
						</div>
	    			</div>
	    		</form>
	    		<hr/>
	    		<form action="../controller.do" method="get">
					<button type="submit" class="btn btn-success" name="command"
					value="ListarProdutos">Listar Produtos</button>
				</form>
	    	</div>
	    	<c:import url="../bootstrap_body.jsp"/>
		</body>
</html>