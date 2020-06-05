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
        <title>Lista de Operadores</title>
    </head>
		<body>
			<!-- Importação da barra de menus -->
	    	<c:import url="../Menu.jsp"/>
	    	
	    	<div id="main" class="container">
	    		<br>
	    		<h3 class="page-header">Lista de Empregados</h3>
	    		<hr>
	    		<form action="controller.do" method="POST">
		            <div id="top" class="row">
		                <div class="col-md-8">
		                    <div class="input-group h2">
		                    
		                        <input name="data[search]" class="form-control" id="search" type="text"
		                            placeholder="Digite o nome do empregado (deixe em branco para listar todos)">
		                            
		                            <button class="btn btn-primary" type="submit" name="command"
										value="ListarOperadores">
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
	    				<div class="table-responsive col-md-12">
	    					<table class="table table-striped">
	    						<thead>
	    							<tr class="lista">
	    								<th>CPF</th>
	    								<th>Nome</th>
	    								<th>Data de nascimento</th>
	    								<th>Gênero</th>
	    								<th>Tipo de empregado</th>
	    								<th>Opções</th>
	    							</tr>
	    						</thead>
	    						<tbody>
	    							<c:forEach var="empregado" items="${lista}">
	    								<tr class="lista">
	    									<th>${empregado.cpf}</th>
	    									<th>${empregado.nome}</th>
	    									<th>${empregado.dt_nsc}</th>
	    									<th>${empregado.genero}</th>
	    									<th>
												<c:if test="${empregado.tipo_emp == 1}">
													Operador de Caixa
												</c:if>
	    										<c:if test="${empregado.tipo_emp == 2}">
													Estoquista
												</c:if>
											</th>
											<th>
	    										<a class="btn btn-info btn-xs" href="controller.do?command=VisualizarOperador&cpf_operador=${empregado.cpf}">Visualizar</a>
	    										<a class="btn btn-info btn-xs" href="controller.do?command=EditarOperador&cpf_operador=${empregado.cpf}">Editar</a>
                                            </th>
	    							</c:forEach>
	    						</tbody>
	    					</table>
	    				</div>
	    			</div>
	    		</c:if>
	    		<c:if test="${empty lista}">
	    		<h2>Nenhum operador cadastrado!</h2>
	    		</c:if>
	    	</div>
	    	<c:import url="../bootstrap_body.jsp"/>
		</body>
</html>