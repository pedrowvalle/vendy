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
        <title>Consulta de Venda</title>
    </head>
		<body>
			<!-- Importação da barra de menus -->
	    	<c:import url="../Menu.jsp"/>
	    	
	    	<div id="main" class="container">
	    		<h3 class="page-header">Consulta de Venda</h3>
	    		<hr>
	    		<div class="row">
	    			<div class="col-6 align-self-center">
	    				<p><strong>Número da venda: </strong></p>
	    				<p>${pedido.cod}</p>
	    			</div>
	    			<div class="col-6 align-self-center">
	    				<p><strong>Produtos: </strong></p>
	    				<p>${pedido.cod_produto}</p>	    			
	    			</div>	    			
	    		</div>
	    		<div class="row">
	    			<div class="col-6 align-self-center">
	    				<p><strong>Data: </strong></p>
	    				<p>${pedido.data_pedido}</p>	    			
	    			</div>
	    			<div class="col-6 align-self-center">
	    				<p><strong>Total: </strong></p>
	    				<p>${pedido.preco}</p>	    			
	    			</div>
	    		</div>
	    		<div class="row">
	    			<div class="col-md-6">
	    				<p><strong>Vendedor: </strong></p>
	    				<p>${pedido.vendedor}</p>	    			
	    			</div>
	    			<div class="col-md-6">
	    				<p><strong>Doc Cliente: </strong></p>
	    				<p>${pedido.cpf_cliente}</p>	    			
	    			</div>
	    		</div>
	    	</div>
	    	<c:import url="../bootstrap_body.jsp"/>
		</body>
</html>