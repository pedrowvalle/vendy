<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- Barra de navega��o (inverse para ficar de cor inversa e top para ficar no topo -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<a class="navbar-brand"
		href="<%=request.getContextPath()%>/operador.jsp">Vendy -
		Sistema de Automa��o Comercial</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbar" aria-controls="navbar" aria-expanded="false">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbar">
			<button type="button" class="btn" data-toggle="modal"
		data-target="#myModal">
				Fechar PDV</button>
		<ul class="navbar-nav mr-auto">

		</ul>
	</div>

	<!-- The Modal -->
	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Fechamento do PDV</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					Confirma o fechamento do caixa?
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<a href="<%=request.getContextPath()%>/operador.jsp" type="button" class="btn btn-success" >Fecha Caixa
						</a>
					<button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
				</div>

			</div>
		</div>
	</div>


</nav>
