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
        <title>Lista de produtos</title>
    </head>
		<body>
			<!-- Importação da barra de menus -->
	    	<c:import url="../Menu.jsp"/>
	    	
	    	<div id="main" class="container">
	    		<br>
	    		<h3 class="page-header">Lista de produtos</h3>
	    		<hr>
	    		<c:if test="${not empty lista}">
	    			<div id="list" class="row">
	    				<div class="table-responsive col-md-12">
	    					<table class="table table-striped">
	    						<thead>
	    							<tr>
	    								<th>Código</th>
	    								<th>Nome</th>
	    								<th>Categoria</th>
	    								<th>Preço</th>
	    								<th>Quantidade em estoque</th>
	    							</tr>
	    						</thead>
	    						<tbody>
	    							<c:forEach var="produto" items="${lista}">
	    								<tr>
	    									<th>${produto.cod}</th>
	    									<th>${produto.nome}</th>
	    									<th>${produto.categoria}</th>
	    									<th>R$ ${produto.preco}</th>
	    									<th>${produto.quantidade}</th>
	    							</c:forEach>
	    						</tbody>
	    					</table>
	    				</div>
	    			</div>
	    		</c:if>
	    		
	    	</div>
	    	<c:import url="../bootstrap_body.jsp"/>
		</body>
</html>