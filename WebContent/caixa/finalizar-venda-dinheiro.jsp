<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="<%= request.getContextPath() %>/css/finalizar_venda_dinheiro.css" rel="stylesheet">
    <title>Finalizar venda</title>
	<c:import url="../bootstrap_head.jsp"/>
</head>
<body>
    <div class="container" id="main">
    	<div class="row" id="main-container">
	        <div class="col-md-6" id="left">
	        	<div class="row" id="left-first-row">
	        		<p id="finalizar-texto"><strong>Finalizar venda</strong></p>
	        	</div>
	        	<div class="row" id="left-second-row">
	        		<div class="col-md-12 scroll tabela" id="area-lista">
	        			<div class="lista" id="lista-produtos">
	                        <table class="table table-striped">
								<thead>
									<th>Produto</th>
									<th>Quantidade</th>
									<th>Preço Unt.</th>
								</thead>
								<tbody>
									<c:forEach var="produto" items="${venda}">
										<tr>
											<td>${produto.nome }</td>
											<td>${produto.cont }</td>
											<td>R$ ${produto.preco }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
	                    </div>
	        		</div>
	        	</div>
	        	<div class="row" id="left-third-row">
		        	<div class="col-md-12" id="area-total">
		        		<p id="total-texto"><strong>${totalTitulo }: </strong>R$ ${totalDinheiro }</p>
		        	</div>
	        	</div>
	        	<div class="row" id="left-fourth-row">
	        		<div class="col-md-12" id="area-btn-voltar">
		        		<a href="<%=request.getContextPath()%>/controller.do?command=TecladoCategorias" class="btn btn-primary">Voltar</a>
		        	</div>
	        	</div>
	        </div>
	        <div class="col-md-6" id="right">
	        	<form action="<%=request.getContextPath()%>/controller.do" method="GET">
	        		<div class="row" id="right-first-row">
		        		<div class="col-md-12" id="area-desconto">
		        			<button id="btn-desconto" type="submit" class="btn btn-primary custom" name="command" value="DinheiroCalcularDesconto">Calcular desconto</button>
		        			<input class="form-control" id="descReais" placeholder="R$ 0,00" onkeypress="return isNumberKey(event)" type="text" name="descReais">
		        			<input class="form-control" id="descPorc" placeholder="0%" onkeypress="return isNumberKey(event)" type="text" name="descPorc">
		        		</div>
	        		</div>
	        	</form>
	        	
	        	<form action="<%=request.getContextPath()%>/controller.do" method="GET">	
		        	<div class="row" id="right-second-row">
		        		<div class="col-md-12" id="area-pagamento">
		        			<button id="btn-troco" type="submit" class="btn btn-primary custom" name="command" value="DinheiroCalcularTroco">Calcular troco</button>
		        			<input class="form-control" id="pagamento" placeholder="R$ 0,00" onkeypress="return isNumberKey(event)" type="text" name="pagamento">
		        		</div>
		        	</div>
		        	</form>
		        	<div class="row" id="right-third-row">
		        		<div class="col-md-12" id="area-resultado">
							<p id="total-texto"><strong>${resultadoTitulo } </strong> ${resultado }</p>					
		        		</div>
		        	</div>
		        	
		        	<div class="row" id="right-fourth-row">
		        		<div class="col-md-12" id="area-btn-limpar-finalizar">
		        			<button type="button" class="btn btn-danger" style="float: right;" data-toggle="modal" data-target="#limpar-pagamentos" id="btn-limpar-pagamentos">Limpar<br>pagamentos</button>
		        			<button type="button" class="btn btn-danger" style="float: right;" data-toggle="modal" data-target="#limpar-descontos" id="btn-limpar-descontos">Limpar<br>descontos</button>
		        			<button type="button" class="btn btn-success" style="float: right;" data-toggle="modal" data-target="#finalizar" id="btn-finalizar">Finalizar<br>venda</button>
		        		</div>
		        	</div>
	        	
        	</div>
        </div>
    </div>
    
    <!-- The Modal -->
	<div class="modal" id="limpar-pagamentos">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Limpar Pagamentos</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					Deseja limpar pagamentos?
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<a href="controller.do?command=DinheiroLimparPagamentos"
						class="btn btn-success">Limpar pagamentos</a>
					<button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
				</div>

			</div>
		</div>
	</div>
	
	   <!-- The Modal -->
	<div class="modal" id="limpar-descontos">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Limpar Descontos</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					Deseja limpar descontos?
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<a href="controller.do?command=DinheiroLimparDesconto"
						class="btn btn-success">Limpar descontos</a>
					<button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
				</div>

			</div>
		</div>
	</div>
	
	<!-- The Modal -->
	<div class="modal" id="finalizar">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Finalizar venda</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					Deseja finalizar a venda?
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<a href="controller.do?command=DinheiroFinalizado"
						class="btn btn-success">Finalizar</a>
					<button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
				</div>

			</div>
		</div>
	</div>
	
	<c:import url="../bootstrap_body.jsp"/>
	<script type="text/javascript" src="<%= request.getContextPath() %>/js/inputText.js"></script>
</body>
</html>