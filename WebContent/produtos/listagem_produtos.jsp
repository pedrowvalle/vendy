<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <!-- Meta tags necessÃ¡rias para o Bootstrap -->
        <meta name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta charset="UTF-8">
        <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style_estoquista.css">
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
	    		<form action="controller.do" method="POST">
		            <div id="top" class="row">
		                <div class="col-md-8">
		                    <div class="input-group h2">
		                    
		                        <input name="data[search]" class="form-control" id="search" type="text"
		                            placeholder="Digite o nome do produto (deixe em branco para listar todos)">
		                            
		                    	<button class="btn btn-primary" type="submit" name="command"
										value="ListarProdutos">
										<span class="glyphicon glyphicon-search" >Pesquisar</span>
								</button>
		                
							</div>
		                </div>
		                
		            </div>
		            <!--Fim da barra de pesquisa superior-->
       		 	</form>
	    		<hr>
	    		<c:if test="${not empty lista}">
	    			<div id="list" class="row">
	    				<div class="table-responsive col-md-12" style="text-align: center">
	    					<table class="table table-striped">
	    						<thead>
	    							<tr>
	    								<th>Código</th>
	    								<th>Nome</th>
	    								<th>Categoria</th>
	    								<th>Preço</th>
	    								<th>Qtd. em estoque</th>
	    								<th>Opções</th>
	    							</tr>
	    						</thead>
	    						<tbody>
	    							<c:forEach var="produto" items="${lista}">
	    								<tr>
	    									<th>${produto.cod}</th>
	    									<th>${produto.nome}</th>
	    									<th>${produto.categoria}</th>
	    									<th>R$ <fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${produto.preco}"/></th>
	    									<th>${produto.quantidade}</th>
	    									<th>
	    										<a class="btn btn-info btn-xs" href="controller.do?command=VisualizarProduto&cod=${produto.cod}">Visualizar</a>
	    										<a class="btn btn-info btn-xs" href="controller.do?command=EditarProduto&cod=${produto.cod}">Editar</a>
                                            </th>
	    							</c:forEach>
	    						</tbody>
	    					</table>
	    				</div>
	    			</div>
	    		</c:if>
	    		<c:if test="${empty lista}">
	    		<h2>Nenhum produto cadastrado!</h2>
	    		</c:if>
	    	</div>
	    	<c:import url="../bootstrap_body.jsp"/>
		</body>
</html>