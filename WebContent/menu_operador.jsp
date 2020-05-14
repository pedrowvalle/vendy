<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- Barra de navegação (inverse para ficar de cor inversa e top para ficar no topo -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<a class="navbar-brand"
		href="<%=request.getContextPath()%>/operador.jsp">Vendy - Sistema
		de Automação Comercial</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbar" aria-controls="navbar" aria-expanded="false">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbar">
		<button type="button" class="btn btn-outline-success"
			data-toggle="modal" data-target="#myModal">Abrir PDV</button>
		<ul class="navbar-nav mr-auto">

		</ul>
		<button type="button" class="btn btn-danger" style="float: right;"
			data-toggle="modal" data-target="#logoff" id="btn-logoff">Logoff</button>
	</div>

	<!-- The Modal -->
	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Abertura de PDV</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					Digite o fundo de caixa: <input type="number">
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<a href="controller.do?command=TecladoInicio"
						class="btn btn-success custom">Abre PDV</a>
					<button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
				</div>

			</div>
		</div>
	</div>
	<!-- The Modal -->
	<div class="modal" id="logoff">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Logoff</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">Deseja mesmo fazer logoff?</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<a href="<%=request.getContextPath()%>/controller.do?command=Logoff" class="btn btn-danger">Fazer
						logoff</a>
					<button type="button" class="btn btn-outline-primary"
						data-dismiss="modal">Cancelar</button>
				</div>

			</div>
		</div>
	</div>

</nav>