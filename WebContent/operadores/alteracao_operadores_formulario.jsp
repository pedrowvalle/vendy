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
        <title>Alterar Operador</title>
    </head>
    <body>
    	<!-- Importação da barra de menus -->
    	<c:import url="../Menu.jsp"/>
		<br>
		<!-- Inicio do container principal -->
        <div id="main" class="container">
        	
            <h3 class="page-header">Alterar Empregado</h3>
            <hr>
				<form action="controller.do" method="GET">
                <div class="row">
                    <div class="form-group col-md-6 mx-auto">
                        <label for="nome_operador">Nome:</label>
                        <input type="text" class="form-control" id="nome_operador" name="nome_operador" placeholder="Digite o nome do empregado"value="${empregado.nome}" required>
                    </div>
                    <div class="form-group col-md-6 mx-auto">
                        <label for="cpf_operador">CPF: </label>
                        <input type="text" class="form-control" id="cpf_operador" name="cpf_operador" placeholder="Apenas numeros"value="${empregado.cpf}" readonly>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6">
	                    <label for="dt_nsc">Data de nascimento: </label>
                        <input type="text" class="form-control" id="dt_nsc" name="dt_nsc" placeholder="Ex.: dd/mm/aaaa" onkeypress="return isNumberKey(event)" onkeydown="javascript: fMasc( this, mData );"  pattern=".{10,}"   required title="Digite uma data de nascimento válida" maxlength="10" value="${empregado.dt_nsc}">
                    </div>
                    <div class="form-group col-md-6">
                    <label for="genero">Gênero: </label>
						  <div class="form-group col-md" style="margin-top:5px;">
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
					</div>
				</div>
				<div class="row">
					<div class="form-group col-md-4">
						<label for="usuario">Usuário: </label>
                        <input type="text" class="form-control" id="usuario" name="usuario" placeholder=""value="${empregado.usuario}">
					</div>
					<div class="form-group col-md-4">
						<label for="senha">Senha: </label>
                        <input type="password" class="form-control" id="senha" name="senha" placeholder=""value="${empregado.senha}">
					</div>
					<div class="form-group col-md-4">
	                    <label for="tipo">Selecione tipo do empregado</label>
		                    <select class="form-control" id="tipo" name="tipo" required>
		                        <option>Operador</option>
		                        <option>Estoquista</option>
		                    </select>
                    </div>
				</div>
                <hr>
                <div class="row">
                	<div id="actions" class="col-md-6 align-self-center">
                		<button type="submit" class="btn btn-primary custom" name="command" value="AlterarOperador">Cadastrar</button>
						<a href="<%=request.getContextPath()%>/controller.do?command=ListarOperadores" class="btn btn-default custom">Cancelar</a>
					</div>
                </div>
            </form>
           	
			<hr>
       		<form action="controller.do" method="get">
       			<div class="row">
					<div class="form-group col-md-6">
						<label for="cod_produto">Para confirmar a exclusão do empregado, digite o CPF:</label>
						<input type="text" class="form-control" id="cpf_operador_del" name="cpf_operador_del" placeholder="Esta ação não pode ser desfeita" pattern=".{14,}" title="Digite um cpf válido" onkeypress="return isNumberKey(event)" onkeydown="javascript: fMasc( this, mCPF );" maxlength="14" required>
						<input type="hidden" class="form-control" id="cpf_aux" name="cpf_aux" value=" ">
					</div>
					<div class="col-md-6 align-self-end custom">
						<button type="submit" class="btn btn-danger" name="command" value="ExcluirOperador" onclick="verificar()">Excluir empregado</button>
					</div>
				</div>
			</form>
           	</div>
		<c:import url="../bootstrap_body.jsp"/>
		<script type="text/javascript" src="<%= request.getContextPath() %>/js/inputText.js"></script>
		<script type="text/javascript">
			function verificar() {
				var cpf = document.getElementById("cpf_operador").value;
				var campo = document.getElementById("cpf_operador_del").value;
				if (campo === cpf)
					document.getElementById("cpf_aux").value = cpf;	
			}
		</script>
	</body>
</html>