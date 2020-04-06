<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Meta tags necessÃ¡rias para o Bootstrap -->
        <meta name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta charset="UTF-8">

        <link rel="stylesheet" href="style_estoquista.css">
        
        <!-- Bootstrap CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <title>Cadastro de Clientes</title>
    </head>
    <body>
    <!-- Barra de navegação (inverse para ficar de cor inversa e top para ficar no topo -->
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
		  <a class="navbar-brand" href="#">Vendy - Sistema de Automação Comercial</a>
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
	          <a class="dropdown-item" href="consulta_produtos.jsp">Consulta</a>
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
		<br>
        <div id="main" class="container">
            <h3 class="page-header">Cadastro de Clientes</h3>
            <hr>
            <form action="ManterCliente" method="GET">
                <div class="row">
                    <div class="form-group col-md-6 mx-auto">
                        <label for="nome_cliente">Nome do Cliente:</label>
                        <input type="text" class="form-control" id="nome_cliente" name="nome_cliente" placeholder="Digite o nome do cliente">
                    </div>
                    <div class="form-group col-md-6 mx-auto">
                        <label for="cpf_cliente">CPF: </label>
                        <input type="number" class="form-control" id="cpf_cliente" name="cpf_cliente" placeholder="Apenas numeros">
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6">
	                    <label for="dt_nsc">Data de Nascimento: </label>
                        <input type="number" class="form-control" id="dt_nsc" name="dt_nsc" placeholder="Formato 'DD/MM/AAAA'">
                    </div>
                    <div class="col-md-3 align-self-center text-center">
                    	<h4>Gênero: </h4>
                    </div>
					<div class="form-group col-md-3" style="margin-top:30px; margin-left:auto">
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="radio" name="genero" id="genero" value="m">
						  <label class="form-check-label" for="genero">Masculino</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="radio" name="genero" id="genero" value="f">
						  <label class="form-check-label" for="inlineRadio2">Feminino</label>
						</div>
					</div>
				</div>
                <hr>
                <div class="row">
                	<div id="actions" class="col-md-6 align-self-center">
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