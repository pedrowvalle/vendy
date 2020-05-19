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
        <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style_listagem.css">
		<c:import url="../bootstrap_head.jsp"/>
        <title>Historico de Vendas</title>
    </head>
		<body>
			<!-- Importação da barra de menus -->
	    	<c:import url="../Menu.jsp"/>
	    	
	    	<div id="main" class="container">
	    		<br>
	    		<h3 class="page-header">Historico de Vendas</h3>
	    		<hr>
	    		<c:if test="${not empty lista}">
	    			<div id="list" class="row">
	    				<div class="table-responsive col-md-12">
	    					<table class="table table-striped">
	    						<thead>
	    							<tr class="lista">
	    								<th>Codigo</th>
	    								<th>Data</th>
	    								<th>Preço</th>
	    								<th>Vendedor</th>
	    								<th>Opções</th>
	    							</tr>
	    						</thead>
	    						<tbody>
	    							<c:forEach var="pedido" items="${lista}">
	    								<tr class="lista">
	    									<th>${pedido.cod}</th>
	    									<th>${pedido.data_pedido}</th>
	    									<th>${pedido.preco}</th>
	    									<th>${pedido.vendedor}</th>
	    									<th>
	    									<a class="btn btn-success btn-xs"
                                            href="controller.do?command=VisualizarVenda&cod=${pedido.cod}">Visualizar</a>
                                            </th>
	    							</c:forEach>
	    						</tbody>
	    					</table>
	    				</div>
	    			</div>
	    		</c:if>
	    		<c:if test="${empty lista}">
	    		<h2>Nenhuma Venda Efetuada! Clique para carregar as vendas:</h2>
	    		</c:if>
	    	</div>
	    	<c:import url="../bootstrap_body.jsp"/>
		</body>
</html>