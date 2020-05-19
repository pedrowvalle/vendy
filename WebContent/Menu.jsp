<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- Barra de navegação (inverse para ficar de cor inversa e top para ficar no topo -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<a class="navbar-brand"
		href="<%=request.getContextPath()%>/estoquista.jsp">Vendy -
		Sistema de Automação Comercial</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbar" aria-controls="navbar" aria-expanded="false">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbar">
		<form action="../TecladoListarCategorias" method="get">
			<a class="nav-link"
				href="<%=request.getContextPath()%>/caixa/teclado.jsp" name="acao"
				value="mostrarTeclado">Teclado</a>
		</form>
		<ul class="navbar-nav mr-auto">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#"
				id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false"> Produtos </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					<a class="dropdown-item"
						href="<%=request.getContextPath()%>/produtos/cadastro_produtos.jsp">Cadastro</a>
					<a class="dropdown-item"
						href="<%=request.getContextPath()%>/produtos/consulta_produto.jsp">Consulta</a>
					<a class="dropdown-item"
						href="<%=request.getContextPath()%>/produtos/alteracao_produto.jsp">Altera</a>
				</div></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#"
				id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false"> Clientes </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					<a class="dropdown-item"
						href="<%=request.getContextPath()%>/clientes/cadastro_clientes.jsp">Cadastro</a>
					<a class="dropdown-item"
						href="<%=request.getContextPath()%>/clientes/consulta_clientes.jsp">Consulta</a>
					<a class="dropdown-item"
						href="<%=request.getContextPath()%>/clientes/alteracao_cliente.jsp">Alteração</a>
				</div></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#"
				id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false"> Operadores </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					<a class="dropdown-item"
						href="<%=request.getContextPath()%>/operadores/cadastro_operadores.jsp">Cadastro</a>
					<a class="dropdown-item"
						href="<%=request.getContextPath()%>/operadores/consulta_operadores.jsp">Consulta</a>
					<a class="dropdown-item"
						href="<%=request.getContextPath()%>/operadores/alteracao_operadores.jsp">Alteração</a>
				</div></li>
				<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#"
				id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false"> Vendas </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					<form action="controller.do" method="get">
					<a class="dropdown-item"
						href="controller.do?command=ListarVendas">Consultar vendas</a>
				</form>	</div>
		</ul>
		<button type="button" class="btn btn-danger" style="float: right;"
			data-toggle="modal" data-target="#logoff" id="btn-logoff">Logoff</button>
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