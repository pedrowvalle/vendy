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
        <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style_listagem.css">
		<c:import url="../bootstrap_head.jsp"/>
        <title>Lista de Clientes</title>
    </head>
		<body>
			<!-- Importação da barra de menus -->
	    	<c:import url="../Menu.jsp"/>
	    	
	    	<div id="main" class="container">
	    		<br>
	    		<h3 class="page-header">Lista de Clientes</h3>
	    		<hr>
	    		<c:if test="${not empty lista}">
	    			<div id="list" class="row">
	    				<div class="table-responsive col-md-12">
	    					<table class="table table-striped">
	    						<thead>
	    							<tr class="lista">
	    								<th>CPF</th>
	    								<th>Nome</th>
	    								<th>Data de nascimento</th>
	    								<th>Gênero</th>
	    								<th>Opções</th>
	    							</tr>
	    						</thead>
	    						<tbody>
	    							<c:forEach var="cliente" items="${lista}">
	    								<tr class="lista">
	    									<th>${cliente.cpf}</th>
	    									<th>${cliente.nome}</th>
	    									<th>${cliente.dt_nsc}</th>
	    									<th>
												<c:if test="${cliente.sexo=='m'}">
													Masculino
												</c:if>
	    										<c:if test="${cliente.sexo=='f'}">
													Feminino
												</c:if>
												<c:if test="${cliente.sexo=='o'}">
													Outro
												</c:if>
	    									</th>
	    									<th>
	    										<a class="btn btn-info btn-xs" href="controller.do?command=VisualizarCliente&cpf_cliente=${cliente.cpf}">Visualizar</a>
	    										<a class="btn btn-info btn-xs" href="controller.do?command=EditarCliente&cpf_cliente=${cliente.cpf}">Editar</a>
                                            </th>
	    							</c:forEach>
	    						</tbody>
	    					</table>
	    				</div>
	    			</div>
	    		</c:if>
	    		<c:if test="${empty lista}">
	    		<h2>Nenhum cliente cadastrado!</h2>
	    		</c:if>
	    	</div>
	    	<c:import url="../bootstrap_body.jsp"/>
		</body>
</html>