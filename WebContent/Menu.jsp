<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- Barra de navegação (inverse para ficar de cor inversa e top para ficar no topo -->
<nav class="navbar navbar-inverse navbar-fixed-top">

	<!-- container-fluid para ocupar toda a extensão horizontal sempre -->
	<div class="container-fluid">

		<!-- navbar-header indica o cabeçalho da navbar -->
		<div class="navbar-header">

			<!-- Botão do tipo Hamburguer -->
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Menu de navegação Superior</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>

			<!-- Link que ficará no cabeçalho da barra (ou logotipo da empresa) -->
			<a class="navbar-brand" href="estoquista.jsp">Vendy - Sistema de Automação Comercial</a>
		</div>

		<!-- Ítens que ficarão no menu hamburguer -->
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right">
            <!--Botão com menu dropdown para selecionar entre cadastro ou consulta de produtos-->
				<li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" 
                        role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Produtos
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="cadastro_produtos.jsp">Cadastro</a>
                        <a class="dropdown-item" href="consulta_produtos.jsp">Consulta</a>
                    </div>
                </li>
                <!--Botão com menu dropdown para selecionar entre cadastro ou consulta de Clientes-->
				<li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" 
                        role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Clientes
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="cadastro_clientes.jsp">Cadastro</a>
                        <a class="dropdown-item" href="consulta_clientes.jsp">Consulta</a>
                    </div>
                </li>
			</ul>
		</div>
	</div>
</nav>