<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Meta tags necessárias para o Bootstrap -->
        <meta name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta charset="UTF-8">

        <link rel="stylesheet" href="style_estoquista.css">
        
        <!-- Bootstrap CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <title>Cadastro de Produtos</title>
    </head>
    <body>
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
        <div id="main" class="container">
            <h3 class="page-header">Cadastro de Produtos</h1>
            <hr>
            <form action="ManterProduto.do" method="GET">
                <div class="row">
                    <div class="form-group col-md-6 mx-auto">
                        <label for="nome_produto">Nome do Produto:</label>
                        <input type="text" class="form-control" id="nome_produto" name="nome_produto" placeholder="Digite o nome do produto">

                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6 mx-auto">
                        <label for="preco">Preço do produto</label>
                        <input type="number" class="form-control" id="preco" name="preco" placeholder="Insira o preço de venda do produto">
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6 mx-auto">
                    <label for="categoria">Selecione a categoria do produto</label>
                    <select class="form-control" id="categoria" name="categoria">
                        <option>Lanches</option>
                        <option>Bebidas</option>
                        <option>Cafeteria</option>
                        <option>Sobremesas</option>
                        <option>Padaria</option>
                        <option>Outros</option>
                    </select>
                </div>
                <div id="actions" class="row">
				<div class="col-md-6 mx-auto">
					<button type="submit" class="btn btn-primary custom" name="acao" value="Criar">Cadastrar</button>
					<a href="cadastro_produtos.jsp" class="btn btn-default custom">Cancelar</a>
				</div>
			</div>
            </form>
        </div>


        <!-- Stcipts Bootstrap -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>