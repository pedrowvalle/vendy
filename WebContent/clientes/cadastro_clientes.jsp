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
        <title>Cadastro de Clientes</title>
    </head>
    <body>
    	<!-- Importação da barra de menus -->
    	<c:import url="../Menu.jsp"/>
		<br>
		<!-- Inicio do container principal -->
        <div id="main" class="container">
            <h3 class="page-header">Cadastro de Clientes</h3>
            <hr>
            <form action="../controller.do" method="get">
                <div class="row">
                    <div class="form-group col-md-6 mx-auto">
                        <label for="nome_cliente">Nome do Cliente:</label>
                        <input type="text" class="form-control" id="nome_cliente" name="nome_cliente" onkeypress="return isNumericKey(event)" placeholder="Digite o nome do cliente" required>
                    </div>
                    <div class="form-group col-md-6 mx-auto">
                        <label for="cpf_cliente">CPF: </label>
                        <input type="text" class="form-control" id="cpf_cliente" name="cpf_cliente" placeholder="Ex.: 000.000.000-00" pattern=".{14,}"   required title="Digite um cpf válido" onkeypress="return isNumberKey(event)" onkeydown="javascript: fMasc( this, mCPF );" maxlength="14">
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6">
	                    <label for="dt_nsc">Data de Nascimento: </label>
                        <input type="text" class="form-control" id="dt_nsc" name="dt_nsc" placeholder="Ex.: dd/mm/aaaa" onkeypress="return isNumberKey(event)" onkeydown="javascript: fMasc( this, mData );"  pattern=".{10,}"   required title="Digite uma data de nascimento válida" maxlength="10">
                    </div>
                    <div class="col-md-3 align-self-center text-center">
                    	<h4>Gênero: </h4>
                    </div>
					<div class="form-group col-md-3" style="margin-top:30px;">
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="radio" name="genero" id="genero" value="m" required>
						  <label class="form-check-label" for="genero">Masculino</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="radio" name="genero" id="genero" value="f" required>
						  <label class="form-check-label" for="inlineRadio2">Feminino</label>
						</div>
					</div>
				</div>
                <hr>
                <div class="row">
                	<div id="actions" class="col-md-6 align-self-center">
						<button type="submit" class="btn btn-primary custom" name="command" value="IncluirCliente">Cadastrar</button>
						<a href="../estoquista.jsp" class="btn btn-default custom">Cancelar</a>
					</div>
                </div>
            </form>
        </div>
		<c:import url="../bootstrap_body.jsp"/>
		<script type="text/javascript" src="<%= request.getContextPath() %>/js/inputText.js"></script>
	</body>
</html>