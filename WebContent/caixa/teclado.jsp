<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Teclado</title>
<link href="<%=request.getContextPath()%>/css/teclado.css"
	rel="stylesheet">
<c:import url="/bootstrap_head.jsp" />
</head>
<body>
	<c:import url="../menu_teclado.jsp" />
	<br>
	<div class="container" id="main">

		<div class="row" id="first-row">
			<div class="col-md-8 tabela" id="lista">
				<div class="col-md-12 scroll" id="area-lista">
					<c:if test="${empty venda }">
						<table class="table table-striped">
							<thead>
								<th>Produto</th>
								<th>Quantidade</th>
								<th>Preço</th>
							</thead>
							<tbody>
								<tr>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</c:if>
					<c:if test="${not empty venda }">
						<table class="table table-striped">
							<thead>
								<th></th>
								<th>Produto</th>
								<th></th>
								<th>Quantidade</th>
								<th></th>
								<th>Preço</th>
							</thead>
							<tbody>
								<c:forEach var="produto" items="${venda}">
									<tr>
										
										<td><a href="<%=request.getContextPath()%>/controller.do?command=TecladoExcluirProduto&cod=${produto.cod}&total=${total}"><img src="images/lixo.png" class="lixo"></a></td>
										<td>${produto.nome }</td>
										<td><a href="<%=request.getContextPath()%>/controller.do?command=TecladoDiminuirQtd&cod=${produto.cod}" id="botaoQuantidade"><img src="images/minus.png" class="modificarQuantidade"></a></td>
										<td>${produto.cont }</td>
										<td><a href="<%=request.getContextPath()%>/controller.do?command=TecladoAumentarQtd&cod=${produto.cod}" id="botaoQuantidade"><img src="images/plus.png" class="modificarQuantidade"></a> </td>
										<td>R$ ${produto.preco }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:if>
				</div>
			</div>
			<div class="col-md-4 tabela" id="total">
				<div class="row">
					<div class="col-md-12 scroll" id="area-total">
						<h1>Total</h1>
						<br><br><br><br>
						<hr/>
						<h1 style="float: right;">R$ <fmt:formatNumber type="number" maxFractionDigits="2" value="${total}"/></h1>
					</div>
				</div>
				<div class="row">
					<button type="button" class="btn btn-danger" style="float: right;" data-toggle="modal"
					data-target="#cancelar" id="botao-cancelar"></button>
					<a href="<%=request.getContextPath()%>/caixa/finalizar-venda.jsp" type="button" class="btn btn-success" style="float: right;" id="botao-finalizar"></a>
				</div>
			</div>
		</div>
		<div class="row" id="second-row">
			<div class="col-md-4" id="categorias">
				<div class="table-responsive col-md-12" id="area-categorias">
					<form action="../controller.do" method="GET">
						<table class="table table-borderless">
							<thead>
								<tr>
									<th>Categorias</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="categoria" items="${categorias}">
									<tr>
										<th><a
											href="<%=request.getContextPath()%>/controller.do?command=TecladoCategorias&categoria=${categoria.categoria }"
											class="btn btn-outline-info btn-block">${categoria.categoria}</a></th>
								</c:forEach>
							</tbody>
						</table>
					</form>
				</div>
			</div>

			<div class="col-md-8" id="produtos">
				<div id="area-produtos">
					<c:forEach var="produto" items="${produtos}">
						<a href="<%=request.getContextPath()%>/controller.do?command=TecladoAddProduto&cod=${produto.cod }&total=${total}&cont=1"
							class="btn btn-outline-primary custom">${produto.nome }</a>
					</c:forEach>
				</div>
			</div>
		</div>
		
	</div>
	<!-- The Modal -->
	<div class="modal" id="modalQuantidade">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Quantidade</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					Quantidade <input type="number" value="1" name="qtd">
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<a href="controller.do?command=TecladoAddProduto&cod=${produto.cod }"
						class="btn btn-outline-primary custom">Confirmar</a>
					<button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
				</div>

			</div>
		</div>
	</div>
	<!-- The Modal -->
	<div class="modal" id="cancelar">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Cancelar a venda</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					Deseja cancelar a venda?
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<a href="controller.do?command=TecladoInicio"
						class="btn btn-outline-primary custom">Confirmar</a>
					<button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
				</div>

			</div>
		</div>
	</div>
	<c:import url="../bootstrap_body.jsp" />
</body>
</html>