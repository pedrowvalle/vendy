<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- Barra de navegação (inverse para ficar de cor inversa e top para ficar no topo -->
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
		  <a class="navbar-brand" href="estoquista.jsp">Vendy - Sistema de Automação Comercial</a>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar"
		  	aria-controls="navbar" aria-expanded="false">
		    <span class="navbar-toggler-icon"></span>
		  </button>
		  <div class="collapse navbar-collapse" id="navbar">
		    <ul class="navbar-nav mr-auto">
		      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          Produtos
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
	          <a class="dropdown-item" href="cadastro_produtos.jsp">Cadastro</a>
	          <a class="dropdown-item" href="consulta_produto.jsp">Consulta</a>
	          <a class="dropdown-item" href="alteracao_produto.jsp">Altera</a>
	        </div>
	      </li>
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          Clientes
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
	          <a class="dropdown-item" href="cadastro_clientes.jsp">Cadastro</a>
	          <a class="dropdown-item" href="consulta_clientes.jsp">Consulta</a>
	        </div>
	      </li>
		    </ul>
		  </div>
		</nav>