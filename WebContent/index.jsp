<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <!-- Meta tags necessárias para o Bootstrap -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta charset="UTF-8">
        
        <link rel="stylesheet" href="css/style_login.css">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <title>Vendy - Login</title>

    </head>
    <body>
        <div id="main" class="container">
            <img src="images/logo.png" class="mx-auto d-block">
        </div>
        <form action="controller.do" method="post">
            <div class="row">
                <div class="form-group col-md-6 mx-auto">
                    <label for="user">Login:</label>
                    <input type="user" class="form-control" id="usuario" name="usuario" placeholder="Digite seu usuário">
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6 mx-auto">
                    <label for="senha">Senha:</label>
                    <input type="password" class="form-control" id="senha" name="senha" placeholder="Digite sua senha">
                </div>
            </div>
            <div id="actions" class="row">
				<div class="col-md-6 mx-auto">
					<button type="submit" class="btn btn-primary custom" name="command" value="Login">Entrar</button>
					<a href="index.jsp" class="btn btn-default custom">Cancelar</a>
				</div>
			</div>
        </form>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>