<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!--Importação de taglibs-->
<!DOCTYPE html>
<html>
    <head>
        <!-- Meta tags necessárias para o Bootstrap -->
        <meta name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta charset="UTF-8">
        <link rel="stylesheet" href="style_estoquista.css">
        <c:import url="bootstrap_head.jsp"/>        
        <title>Estoquista</title>
    </head>
    <body>
	    <!-- Importação da barra de menus -->
    	<c:import url="Menu.jsp"/>
		<br>
		<!-- Inicio do container principal -->
		<br>
	    <div id="main" class="container">
	        <h1 class="mx-auto d-block">Bem vindo, <!--nome do operador por jsp--></h1>
	        <h3 class="mx-auto d-block">Selecione uma opção no menu acima</h3>
	    </div>
    	<c:import url="bootstrap_body.jsp"/>    
	</body>
</html>