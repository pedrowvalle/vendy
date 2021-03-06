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
        <title>Alterar Clientes</title>
    </head>
    <body>
    	<!-- Importação da barra de menus -->
    	<c:import url="../Menu.jsp"/>
		<br>
		<!-- Inicio do container principal -->
        <div id="main" class="container">
        	<br>
            <h3 class="page-header">Alterar Clientes</h3>
            <hr>
				<form action="controller.do" method="get">
    				<div class="row">
    					<div class="form-group col-md-12 mx-auto">
	                        <label for="cpf_cliente">CPF:</label>
	                        <input type="text" class="form-control" value="${cliente.cpf}" id="cpf_cliente" name="cpf_cliente" readonly>
	                    </div>
    				</div>
                	<div class="row">
	                    <div class="form-group col-md-6 mx-auto">
	                        <label for="nome_cliente">Nome do Cliente:</label>
	                        <input type="text" class="form-control" value="${cliente.nome}" id="nome_cliente" name="nome_cliente" placeholder="Digite o nome do cliente" required>
	                    </div>
	                    <div class="form-group col-md-6 mx-auto">
	                        <label for="dt_nsc">Data de Nascimento</label>
	                        <input type="text" class="form-control" value="${cliente.dt_nsc}" id="dt_nsc" name="dt_nsc" placeholder="Ex.: dd/mm/aaaa" onkeypress="return isNumberKey(event)" onkeydown="javascript: fMasc( this, mData );"  pattern=".{10,}"   required title="Digite uma data de nascimento válida" maxlength="10">
	                    </div>
                	</div>
                	
	                <div class="col">
	                    <div class="form-group col-md-6 mx-auto">
                    	
                    </div>
                    
					<div class="row align-items-start">
						<label for="genero">Gênero: </label>
						  <div class="form-group col-md" style="margin-top:1px;">
							<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="radio" name="genero" id="genero" value="m" required>
						  	<label class="form-check-label" for="genero">Masculino</label>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						  	<input class="form-check-input" type="radio" name="genero" id="genero" value="f" required>
						  	<label class="form-check-label" for="genero">Feminino</label>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						  	<input class="form-check-input" type="radio" name="genero" id="genero" value="o" required>
						  	<label class="form-check-label" for="genero">Outro</label>
							</div>
						</div>
					
                
                	<div id="actions" class="row align-self-center">
						<button type="submit" class="btn btn-primary" name="command" value="AlterarCliente">Alterar</button>
						<a href="<%=request.getContextPath()%>/controller.do?command=ListarClientes" class="btn btn-default">Cancelar</a>
					</div>
					</div>
					</div>
               
            </form>
             
           	<hr>
       		<form action="controller.do" method="get">
       			<div class="row">
					<div class="form-group col-md-6">
						<label for="cpf_cliente_del">Para confirmar a exclusão do Cliente, confirme o CPF:</label>
						<input type="text" class="form-control" id="cpf_cliente_del" name="cpf_cliente_del" placeholder="Esta ação não pode ser desfeita" pattern=".{14,}" title="Digite um cpf válido" onkeypress="return isNumberKey(event)" onkeydown="javascript: fMasc( this, mCPF );" maxlength="14" required>
						<input type="hidden" class="form-control" id="cpf_aux" name="cpf_aux" value=" ">
					</div>
					<div class="col-md-6 align-self-end custom">
						<button type="submit" class="btn btn-danger" name="command"	value="ExcluirCliente" onclick="verificar()">Apagar Cliente</button>
					</div>
				</div>
			</form>
           	</div>
		<c:import url="../bootstrap_body.jsp"/>
		<script type="text/javascript" src="<%= request.getContextPath() %>/js/inputText.js"></script>
		<script type="text/javascript">
			function verificar() {
				var cpf = document.getElementById("cpf_cliente").value;
				var campo = document.getElementById("cpf_cliente_del").value;
				if (campo === cpf)
					document.getElementById("cpf_aux").value = cpf;	
			}
		</script>
	</body>
</html>