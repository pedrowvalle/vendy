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
		<ul class="navbar-nav mr-auto">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#"
				id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false"> Produtos </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					<a class="dropdown-item"
						href="<%=request.getContextPath()%>/produtos/cadastro_produtos.jsp">Cadastrar produto</a>
					<a class="dropdown-item"
						href="<%=request.getContextPath()%>/controller.do?command=ListarProdutos">Listar produtos</a>
				</div></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#"
				id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false"> Clientes </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					<a class="dropdown-item"
						href="<%=request.getContextPath()%>/clientes/cadastro_clientes.jsp">Cadastrar cliente</a>
					<a class="dropdown-item"
						href="<%=request.getContextPath()%>/controller.do?command=ListarClientes">Listar clientes</a>
				</div></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#"
				id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false"> Empregados </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					<a class="dropdown-item"
						href="<%=request.getContextPath()%>/operadores/cadastro_operadores.jsp">Cadastrar empregado</a>
					<a class="dropdown-item"
						href="<%=request.getContextPath()%>/controller.do?command=ListarOperadores">Listar empregados</a>
				</div></li>
				<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#"
				id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false"> Vendas </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					<form action="controller.do" method="get">
					<a class="dropdown-item"
						href="<%=request.getContextPath()%>/controller.do?command=ListarVendas">Consultar vendas</a>
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