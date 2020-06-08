<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <!-- Meta tags necessÃ¡rias para o Bootstrap -->
        <meta name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta charset="UTF-8">
        <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style_estoquista.css">
		<c:import url="../bootstrap_head.jsp"/>
        <title>Alterar Produtos</title>
    </head>
    <body>
    	<!-- Importação da barra de menus -->
    	<c:import url="../Menu.jsp"/>
		<br>
		<!-- Inicio do container principal -->
        <div id="main" class="container">
        	
            <h3 class="page-header">Alterar Produto</h3>
            <hr>
				<form action="controller.do" method="GET">
    				<div class="row">
    					<div class="form-group col-md-12 mx-auto">
	                        <label for="cod_produto">Código do produto:</label>
	                        <input type="text" class="form-control" value="${produto.cod}" id="cod_produto" name="cod_produto" readonly>
	                    </div>
    				</div>
                	<div class="row">
	                    <div class="form-group col-md-6 mx-auto">
	                        <label for="nome_produto">Nome:</label>
	                        <input type="text" class="form-control" value="${produto.nome}" id="nome_produto" name="nome_produto" placeholder="Digite o nome do produto" required>
	                    </div>
	                    <div class="form-group col-md-6 mx-auto">
	                        <label for="preco">Preço:</label>
	                        <input type="text" class="form-control" value="${produto.preco}" id="preco" name="preco" placeholder="Insira o preço de venda do produto" onkeypress="return isNumberKey(event)" required>
	                    </div>
                	</div>
	                <div class="row">
	                    <div class="form-group col-md-6 mx-auto">
		                    <label for="categoria">Selecione a categoria do produto</label>
			                    <select class="form-control" value="${produto.categoria}" id="categoria" name="categoria">
			                        <option>Lanches</option>
			                        <option>Bebidas</option>
			                        <option>Cafeteria</option>
			                        <option>Sobremesas</option>
			                        <option>Padaria</option>
			                        <option>Outros</option>
			                    </select>
			              </div>
					<div class="form-group col-md-6 mx-auto">
						<label for="estoque">Digite nova quantidade do estoque</label>
						<input type="text" class="form-control" value="${produto.quantidade}" id="estoque" name="estoque" placeholder = "Quantidade inicial de estoque" onkeypress="return isOnlyNumber(event)" required>
					</div>
                </div>
                <div class="row">
                	<div id="actions" class="col-md-6">
						<button type="submit" class="btn btn-primary" name="command" value="AlterarProduto">Alterar</button>
						<a href="<%=request.getContextPath()%>/controller.do?command=ListarProdutos" class="btn btn-default">Cancelar</a>
					</div>
                </div>
            </form>
           	<hr>
       		<form action="controller.do" method="GET">
       			<div class="row">
					<div class="form-group col-md-6">
						<label for="cod_produto_del">Para confirmar a exclusão, digite o código do produto:</label>
						<input type="text" class="form-control" id="cod_produto_del" name="cod_produto_del" placeholder="Esta ação não pode ser desfeita" pattern=".{1,}" title="Digite um código válido" onkeypress="return isOnlyNumber(event)" required>
						<input type="hidden" class="form-control" id="cod_aux" name="cod_aux" value="-1">
					</div>
					<div class="col-md-6 align-self-end custom">
						<button type="submit" class="btn btn-danger" name="command"
						value="ExcluirProduto" onclick="verificar()">Excluir produto</button>
					</div>
				</div>
			</form>
           	</div>
		<c:import url="../bootstrap_body.jsp"/>
		<script type="text/javascript" src="<%= request.getContextPath() %>/js/inputText.js"></script>
		<script type="text/javascript">
			function verificar() {
				var cod = document.getElementById("cod_produto").value;
				var campo = document.getElementById("cod_produto_del").value;
				if (campo === cod)
					document.getElementById("cod_aux").value = cod;	
			}
		</script>
	</body>
</html>