<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Teclado</title>
<link href="<%=request.getContextPath()%>/css/teclado.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css"
	rel="stylesheet">

<c:import url="/bootstrap_head.jsp" />
</head>
<body>
	<c:import url="../menu_teclado.jsp" />
	<br>
	<div class="container" id="main">

		<div class="row" id="first-row">
			<div class="col-md-8 tabela" id="lista">
				<div class="col-md-12" id="area-lista">
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
				</div>
			</div>
			<div class="col-md-4 tabela" id="total">
				<div class="col-md-12" id="area-total">
					<table class="table table-striped">
						<thead>
							<th>Total</th>
						</thead>
						<tbody>
							<tr>
								<td></td>
							</tr>
							<tr>
								<td></td>
							</tr>
							<tr>
								<td></td>
							</tr>
							<tr>
								<td></td>
							</tr>
							<tr>
								<td></td>
							</tr>
							<tr>
								<td></td>
							</tr>
							<tr>
								<td></td>
							</tr>
							<tr>
								<td></td>
							</tr>
							<tr>
								<td></td>
							</tr>
							<tr>
								<td></td>
							</tr>
							<tr>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="row" id="second-row">
			<div class="col-md-4" id="categorias">
				<div class="table-responsive col-md-12" id="area-categorias">
					<form action="TecladoListarProdutos" method="GET">
						<table class="table table-borderless">
							<thead>
								<tr>
									<th>Categorias</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="produto" items="${categorias}">
									<tr>
										<th>
											<button type="submit" class="btn btn-outline-info btn-block"
												value="${produto.categoria }" name="categoria">
												${produto.categoria }</button>
										</th>
								</c:forEach>
							</tbody>
						</table>
					</form>
				</div>
			</div>

			<div class="col-md-8" id="produtos">
				<div id="area-produtos">
					<c:forEach var="produto" items="${produtos}">
						<button type="submit" class="btn btn-outline-primary custom"
							name="acao" href="#">${produto.nome}</button>
					</c:forEach>
				</div>
			</div>
		</div>

	</div>
	<c:import url="../bootstrap_body.jsp" />
</body>
</html>