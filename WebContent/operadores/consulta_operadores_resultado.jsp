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
        <title>Consulta de Operador</title>
    </head>
		<body>
			<!-- Importação da barra de menus -->
	    	<c:import url="../Menu.jsp"/>
	    	
	    	<div id="main" class="container">
	    	<br>
	    		<h3 class="page-header">Consulta de Operador</h3>
	    		<hr>
	    		<div class="row">
	    			<div class="col-6 align-self-center">
	    				<p><strong>CPF: </strong></p>
	    				<p>${empregado.cpf}</p>
	    			</div>
	    			<div class="col-6 align-self-center">
	    				<p><strong>Nome: </strong></p>
	    				<p>${empregado.nome}</p>	    			
	    			</div>	    			
	    		</div>
	    		<div class="row">
	    			<div class="col-4 align-self-center">
	    				<p><strong>Data de nascimento: </strong></p>
	    				<p>${empregado.dt_nsc}</p>	    			
	    			</div>
	    			<div class="col-4 align-self-center">
	    				    			
	    			</div>
	    			<div class="col-4 align-self-center">
	    				    			
	    			</div>
	    		</div>
	    		<a href="<%=request.getContextPath()%>/controller.do?command=ListarOperadores" class="btn btn-primary">Voltar</a>
	    	</div>
	    	<c:import url="../bootstrap_body.jsp"/>
		</body>
</html>