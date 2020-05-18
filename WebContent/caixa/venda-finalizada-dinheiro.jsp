<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="<%= request.getContextPath() %>/css/venda-finalizada-dinheiro.css" rel="stylesheet">
    <title>Venda finalizada</title>
	<c:import url="../bootstrap_head.jsp"/>
</head>
<body>
	<c:import url="../menu_venda_finalizada.jsp" />

    <div class="container" id="main">
    	
			<div class="row" id="row-titulo">
				<p id="titulo-texto"><strong>Venda<br>finalizada!</strong></p>
			</div>
			<div class="row" id="row-dados">
				<div class="col-md-5" id="esquerda">
					<div class="row" id="row-pagamento">
						<p id="titulo-texto"><strong>Pagamento: </strong></p>
						<input type="text" class="form-control" READONLY value="Dinheiro"/> 
					</div>
					<div class="row" id="row-cpf">
						<p id="titulo-texto"><strong>CPF: </strong></p>
						<input type="text" class="form-control" id="cpfClienteFinalizado" name="cpfClienteFinalizado" readonly value=${cpfClienteFinalizado }   >
					</div>
				</div>
				<div class="col-md-1" id="meio"></div>
				<div class="col-md-6" id="direita">
					<div class="row" id="row-total">
						<p id="titulo-texto"><strong>Total: </strong></p>
   						<input type="text" class="form-control" id='txt' readonly value=${total } >
					</div>
					<div class="row" id="row-desconto">
						<p id="titulo-texto"><strong>Desconto: </strong></p>
   						<input type="text" class="form-control" id='txt' readonly value=${valorDescontado }>
					</div>
					<div class="row" id="row-recebido">
						<p id="titulo-texto"><strong>Pagamento: </strong></p>
   						<input type="text" class="form-control" id='txt' readonly value=${valorRecebido } >
					</div>
					<div class="row" id="row-troco">
						<p id="titulo-texto"><strong>Troco: </strong></p>
   						<input type="text" class="form-control" id='txt' readonly value=${valorTroco } >
					</div>
				</div>
			</div>
			<div class="row" id="row-botoes">
				<div class="form-row">
		        	<div class="col">
		        		<button type="button" class="btn btn-primary" style="float: right;" data-toggle="modal" data-target="#imprimir" id="btn-limpar-descontos">Imprimir recibo</button>
		        	</div>
					<div class="col">
						<button type="button" class="btn btn-primary" style="float: right;" data-toggle="modal" data-target="#proxima-venda" id="btn-limpar-pagamentos">Próxima venda</button>
					</div>
				</div>
		
        </div>
        
    <!-- Modals -->

    <!-- The Modal -->
	<div class="modal" id="imprimir">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Recibo</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					Deseja imprimir o recibo?
				</div>
				
				<!-- Modal footer -->
				<div class="modal-footer">
					<a href="#"
						class="btn btn-success">Imprimir</a>
					<button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
				</div>

			</div>
		</div>
	</div>
	
	  <!-- The Modal -->
	<div class="modal" id="proxima-venda">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Próxima venda</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					Deseja realizar uma nova venda?
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<a href="controller.do?command=TecladoInicio"
						class="btn btn-success">Nova venda</a>
					<button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
				</div>
			</div>
		</div>
	</div>
	
    </div>
	<c:import url="../bootstrap_body.jsp"/>
	<script type="text/javascript" src="<%= request.getContextPath() %>/js/inputText.js"></script>
	<script type="text/javascript">
		function fMasc(objeto,mascara) {
			obj=objeto
			masc=mascara
			setTimeout("fMascEx()",1)
		}
		function fMascEx() {
			obj.value=masc(obj.value)
		}
		function mCPF(cpf){
			cpf=cpf.replace(/\D/g,"")
			cpf=cpf.replace(/(\d{3})(\d)/,"$1.$2")
			cpf=cpf.replace(/(\d{3})(\d)/,"$1.$2")
			cpf=cpf.replace(/(\d{3})(\d{1,2})$/,"$1-$2")
			return cpf
		}
	</script>

	

	
</body>
</html>