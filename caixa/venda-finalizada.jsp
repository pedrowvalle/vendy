<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/venda-finalizada.css" rel="stylesheet">
    <title>Venda finalizada</title>
	<c:import url="../bootstrap_head.jsp"/>
</head>
<body>
    <div class="container" id="main-container">
        <div class="row" id="titulo">
            <div class="cold-md-12">
                <p><strong>Venda<br>finalizada!</strong></p>
            </div>
        </div>
        <div class="row" id="meio">
            <div class="col-md-6" id="esquerda">
                <div class="row" id="row-pagamento">
                    <p id="pagamento-titulo">Pagamento:</p>
                    <input type="text" class="col-md-3" name="nome" id="pagamento-campo" maxlength="100" value="Dinheiro"/>
                </div>
                <div class="row" id="row-cpf">
                    <p id="pagamento-titulo">CPF:</p>
                    <input type="text" class="col-md-3" name="nome" id="cpf-campo" maxlength="100" value="___.___.___-__"/>
                </div>
            </div>
            <div class="col-md-5" id="direita">
                <div class="row" id="row-total">
                    <p id="total-titulo">Total:</p>
                    <input type="text" class="col-md-3" name="nome" id="total-campo" maxlength="100" placeholder="R$0,00"/>
                </div>
                <div class="row" id="row-recebido">
                    <p id="recebido-titulo">Recebido:</p>
                    <input type="text" class="col-md-3" name="nome" id="recebido-campo" maxlength="100" placeholder="R$0,00"/>
                </div>
                <div class="row" id="row-troco">
                    <p id="troco-titulo">Troco:</p>
                    <input type="text" class="col-md-3" name="nome" id="troco-campo" maxlength="100" placeholder="R$0,00"/>
                </div>
            </div>
        </div>
        <div class="row" id="botoes">
            <button href="#" type="button" class="btn-primary" id="imprimir">Imprimir<br>nota fiscal</button>
            <button onclick="location.href='teclado.jsp'" href="#" type="button" class="btn-primary" id="proxima-venda">Próxima venda</button>
        </div>
    </div>
    
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
	<c:import url="../bootstrap_body.jsp"/>
</body>
</html>