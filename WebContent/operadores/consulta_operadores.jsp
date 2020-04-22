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
	    	
	    	<div id="main" class="container">
	    		<br>
	    		<h3 class="page-header">Alterar Operador</h3>
	    		<hr>
	    		<form action="../ManterOperador" method="get">
	    			<div class="row">
	    				<div class="form-group col-md-6">
	    					<label for="cod_produto">Digite o CPF do operador: </label>
	    					<input type="text" class="form-control" id="cpf_operador" name="cpf_operador" placeholder="Apenas números">
	    				</div>
	    				<div class="col-md-6 align-self-end custom">
							<button type="submit" class="btn btn-primary" name="acao" value="visualizar">Consultar</button>
							<a href="consulta_operadores.jsp" class="btn btn-default">Cancelar</a>
						</div>
	    			</div>
	    		</form>
	    		<hr/>
	    		<form action="../ListarOperadores" method="get">
					<button type="submit" class="btn btn-success" name="acao"
					value="listar">Listar Operadores</button>
				</form>
	    	</div>
	    	<c:import url="../bootstrap_body.jsp"/>
		</body>
</html>