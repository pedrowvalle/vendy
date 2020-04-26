<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="<%= request.getContextPath() %>/css/finalizar-venda-style.css" rel="stylesheet">
    <title>Finalizar venda</title>
	<c:import url="../bootstrap_head.jsp"/>
</head>
<body>
    <div class="container">
        <div class="row" id="main-container">
            <div class="col-md-6" id="esquerdo">
                <div class="row" id="row-finalizar-venda">
                    <p id="finalizar"><strong>Finalizar Venda</strong></p>
                </div>
                <div class="row" id="row-lista">
                    <div class="lista" id="lista-produtos">
                        <a class="col">Item</a>
                        <a class="col">Produto</a>
                        <a class="col">Qtd.</a>
                        <a class="col" id="ultimo">Preço</a>
                        <p id="total">Total: R$0,00</p>
                    </div>
                </div>
                <div class="row" id="row-voltar">
                    <button onclick="location.href='teclado.jsp'" type="button" class="btn-primary" id="voltar">Voltar</button>
                </div>
            </div>
            <div class="col-md-6" id="direito">
                <div class="row" id="row-taxas">
                    <p id="taxas">Taxas: </p>
                    <input type="text" class="col-md-6" name="nome" id="campo-taxa" maxlength="6" placeholder="R$ 0,00"/>
                </div>
                <div class="row" id="row-desconto">
                    <p id="taxas">Desconto:</p>
                    <input type="text" class="col-md-3" name="nome" id="campo-esquerdo" maxlength="6" placeholder="0,00"/>
                    <input type="text" class="col-md-3" name="nome" id="campo-direito" maxlength="3" placeholder="0%"/>
                </div>
                <div class="row" id="row-dinheiro">
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                          Pagamento
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                          <a class="dropdown-item" href="#">Dinheiro</a>
                          <a class="dropdown-item" href="#">Crédito</a>
                          <a class="dropdown-item" href="#">Débito</a>
                        </div>
                    </div>
                    <input type="text" class="col-md-5" name="nome"  id="campo-dinheiro" maxlength="6" placeholder="R$ 0,00"/>
                </div>
                <div class="row" id="row-recebido">
                    <p id="recebido-titulo">Recebido:</p>
                    <p id="recebido-valor"><strong>R$ 0,00</strong></p>
                </div>
                <div class="row" id="row-falta">
                    <p id="falta-titulo">Falta:</p>
                    <p id="falta-valor"><strong>R$ 0,00</strong></p>
                </div>
                <div class="row" id="row-limpar-finalizar">
                    <button href="#" type="button" class="btn-danger" id="limpar">Limpar<br>pagamentos</button>
                    <button onclick="location.href='venda-finalizada.jsp'" href="#" type="button" class="btn-success" id="finalizar">Finalizar<br>venda</button>
                </div>
            </div>
        </div>
    </div>
	<c:import url="../bootstrap_body.jsp"/>
</body>
</html>