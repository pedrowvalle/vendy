<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <!-- Meta tags necessÃ¡rias para o Bootstrap -->
        <meta name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta charset="UTF-8">
        <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style_estoquista.css">
		<c:import url="../bootstrap_head.jsp"/>
        <title>Consulta de Produtos</title>
    </head>
		<body>
			<!-- Importação da barra de menus -->
	    	<c:import url="../Menu.jsp"/>
	    	
	    	<div id="main" class="container">
	    	<br>
	    		<h3 class="page-header">Consulta de produto</h3>
	    		<hr>
	    		<div class="row">
	    			<div class="col-6 align-self-center">
	    				<p><strong>Código: </strong></p>
	    				<p>${produto.cod}</p>
	    			</div>
	    			<div class="col-6 align-self-center">
	    				<p><strong>Nome: </strong></p>
	    				<p>${produto.nome}</p>	    			
	    			</div>	    			
	    		</div>
	    		<div class="row">
	    			<div class="col-6 align-self-center">
	    				<p><strong>Categoria: </strong></p>
	    				<p>${produto.categoria}</p>	    			
	    			</div>
	    			<div class="col-6 align-self-center">
	    				<p><strong>Preço: </strong></p>
	    				<p>R$ <fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${produto.preco}"/></p>	    			
	    			</div>
	    		</div>
	    		<div class="row">
	    			<div class="col-md-12">
	    				<p><strong>Quantidade em estoque: </strong></p>
	    				<p>${produto.quantidade}</p>	    			
	    			</div>
	    		</div>
	    		<a href="<%=request.getContextPath()%>/controller.do?command=ListarProdutos" class="btn btn-primary">Voltar</a>
	    	</div>
	    	<c:import url="../bootstrap_body.jsp"/>
		</body>
</html>