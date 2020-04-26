<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teclado</title>
    <link href="<%= request.getContextPath() %>/css/teclado-style.css" rel="stylesheet">
    <link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
	<c:import url="../bootstrap_head.jsp"/>
</head>
<body>
    <div class="container">
        <div class="row" id="main-container">
            <div class="col-md-8" id="esquerdo">
                <div class="lista">
                    <ul id = "colunas">
                        <a class="col">Item</a>
                        <a class="col">Produto</a>
                        <a class="col">Qtd.</a>
                        <a class="col" id="ultimo">Preço</a>
                    </ul>
                </div>
                <div class="row" id="categorias-quantidade-container">
                    <div class="col-sd-4" id="categorias-quantidade">
                        <button href="#" type="button" class="btn-secondary" id="categorias">Categorias</button>
                        <button href="#" type="button" class="btn-secondary" id="quantidade">Quantidade</button>
                    </div>
                </div>
                <div class="row" id="produtos-prox-container">
                    <div class="col-sd-4" id="produtos-prox"> 
                        <button href="#" type="button" class="btn-secondary" id="produtos">Produtos</button>
                        <button href="#" type="button" class="btn-secondary" id="prox"></button>
                    </div>
                </div>
            </div>
            <div class="col-md-4" id="direito">
                <div class="row">
                    <div class="col-md-12">
                        <div class="total">
                            <p class="total-titulo">Total</p>
                            <p class="total-preco">R$ 0,00</p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="teclado">
                            <div class="row" id="numpad">
                                <button href="#" type="button" class="btn-secondary" id="num">7</button>
                                <button href="#" type="button" class="btn-secondary" id="num">8</button>
                                <button href="#" type="button" class="btn-secondary" id="num">9</button>
                            </div>
                            <div class="row" id="numpad">
                                <button href="#" type="button" class="btn-secondary" id="num">4</button>
                                <button href="#" type="button" class="btn-secondary" id="num">5</button>
                                <button href="#" type="button" class="btn-secondary" id="num">6</button>
                            </div>
                            <div class="row" id="numpad">
                                <button href="#" type="button" class="btn-secondary" id="num">1</button>
                                <button href="#" type="button" class="btn-secondary" id="num">2</button>
                                <button href="#" type="button" class="btn-secondary" id="num">3</button>
                            </div>
                            <div class="row" id="numpad">
                                <button onclick="location.href='finalizar-venda.jsp'" href="finalizar-venda.jsp" type="button" class="btn-secondary" id="finalizar"></button>
                                <button href="#" type="button" class="btn-secondary" id="num">0</button>
                                <button href="#" type="button" class="btn-secondary" id="deletar"></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<c:import url="../bootstrap_body.jsp"/>
</body>
</html>