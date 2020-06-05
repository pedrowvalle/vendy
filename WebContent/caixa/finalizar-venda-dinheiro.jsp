<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="<%= request.getContextPath() %>/css/finalizar_venda_dinheiro.css" rel="stylesheet">
    <title>Finalizar venda</title>
	<c:import url="../bootstrap_head.jsp"/>
</head>
<body>
	<c:import url="../menu_finalizar_venda.jsp" />

    <div class="container" id="main">
    	<div class="row" id="main-container">
    	
	        <div class="col-md-6" id="left">

	        	<div class="row" id="left-second-row">
	        		<div class="col-md-12  tabela" id="area-lista">
						
	        			<div class="lista scroll" id="lista-produtos">
	                        <table class="table table-striped">
								<thead>
									<th>Produto</th>
									<th>Quantidade</th>
									<th>Preço Unt.</th>

								</thead>
								<tbody>
									<c:forEach var="produto" items="${venda}">
										<tr>
											<td>${produto.nome }</td>
											<td>${produto.cont }</td>
											<td>R$ ${produto.preco }</td>

										</tr>
									</c:forEach>
								</tbody>
							</table>

	                    </div>
	        		</div>
	        	</div>
	        	<div class="row" id="left-third-row">
		        	<div class="col-md-12" id="area-total">
		        		<p id="total-texto"><strong>${totalTitulo }: </strong>R$ ${totalDinheiro }</p>
		        	</div>
	        	</div>
	        	<div class="row" id="left-fourth-row">
	        		<div class="col-md-12" id="area-btn-voltar">
		        		<a href="<%=request.getContextPath()%>/controller.do?command=TecladoCategorias" class="btn btn-lg btn-primary" id="btn-voltar">Voltar</a>
		        	</div>
	        	</div>
	        </div>
	        
	        <div class="col-md-6" id="right">
	        	<form action="<%=request.getContextPath()%>/controller.do" method="GET">
	        		<div class="row" id="right-first-row">
		        		<div class="col-md-12" id="area-desconto">	
		        			  <div class="form-row">
		        			  	<div class="col">
		        			  		<button id="btn-desconto" type="submit" class="btn btn-primary custom" name="command" value="DinheiroCalcularDesconto">Calcular desconto</button>
		        			  	</div>
							 	<div class="col">
							 		<div class="input-group">
							 			<span class="input-group-addon" id="sizing-addon1">R$</span>
							 			<input class="form-control" id="descReais" placeholder="0.00" onkeypress="return isNumberKey(event)" type="text" name="descReais" aria-describedby="sizing-addon1">
							 		</div>
							 	</div>
							 	<div class="col">
							 		<div class="input-group">
							 			<span class="input-group-addon" id="sizing-addon2">%</span>
							 			<input class="form-control" id="descPorc" placeholder="0" onkeypress="return isNumberKey(event)" type="text" name="descPorc" aria-describedby="sizing-addon2">
							 		</div>
							 	</div>
							 </div>
		        		</div>
	        		</div>
	        	</form>
	        	<form action="<%=request.getContextPath()%>/controller.do" method="GET">	
		        	<div class="row" id="right-second-row">
		        		<div class="col-md-12" id="area-pagamento">
		        			<div class="form-row">
		        			  	<div class="col">
		        			  		<button id="btn-troco" type="submit" class="btn btn-primary custom" name="command" value="DinheiroCalcularTroco">Receber</button>
		        			  	</div>
							 	<div class="col col-md-8">
							 		<div class="input-group">
							 			<span class="input-group-addon" id="sizing-addon3">R$</span>
							 			<input class="form-control" id="pagamento" placeholder="0.00" onkeypress="return isNumberKey(event)" onkeydown="javascript: formatMoney(this)"type="text" name="pagamento" aria-describedby="sizing-addon3">
							 		</div>						 		
							 	</div>
							 </div>
		        		</div>
		        	</div>
		        </form>
		        <div class="row" id="right-third-row">
		        	<div class="col-md-12" id="area-resultado">
		        		
		        			<p id="total-texto"><strong>Recebido: </strong>R$ ${valorRecebido }</p>	
		        			<p id="total-texto"><strong>${resultadoTitulo } </strong> ${resultado }</p>
		        			
		        			<input type="hidden" id="totalModal" name="xxxx" value=${totalDinheiro }>
		        			<input type="hidden" id="pagamentoModal" name="xxxx" value=${valorRecebido }>
		        			<input type="hidden" id="trocoModal" name="xxxx" value=${resultadoTitulo }>	

										
		        	</div>
		        </div>
		        <div class="row" id="right-fourth-row">
		        	<div class="col-md-12" id="area-btn-limpar-finalizar">
		        		<div class="form-row">
		        			 <button type="button" class="btn btn-lg btn-danger" style="float: right;" data-toggle="modal" data-target="#limpar-descontos" id="btn-limpar-descontos">Limpar<br>descontos</button>
							 <button type="button" class="btn btn-lg btn-danger" style="float: right;" data-toggle="modal" data-target="#limpar-pagamentos" id="btn-limpar-pagamentos">Limpar<br>pagamentos</button>
							 <button type="button" class="btn btn-lg btn-success" id="btn-finalizar" onclick="verificar()">Finalizar<br>venda</button>
						</div>
		        	</div>
		        </div>
        	</div>
        </div>
    </div>
    
    <!-- The Modal -->
	<div class="modal" id="limpar-pagamentos">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Limpar Pagamentos</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					Deseja limpar pagamentos?
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<a href="controller.do?command=DinheiroLimparPagamentos"
						class="btn btn-success">Limpar pagamentos</a>
					<button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
				</div>

			</div>
		</div>
	</div>
	
	<!-- The Modal -->
	<div class="modal" id="limpar-descontos">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Limpar Descontos</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					Deseja limpar descontos?
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
				
					<a href="controller.do?command=DinheiroLimparDesconto"
						class="btn btn-success">Limpar descontos</a>
					<button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
				</div>

			</div>
		</div>
	</div>
	
	<!-- The Modal -->
	<div class="modal" id="pagamentoInferior">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Pagamento insuficiente</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<p>O valor do pagamento é inferior ao valor da venda.</p>
					<p>Resta a ser pago: ${resultado }</p>
				</div>
			</div>
		</div>
	</div>
	
	<!-- The Modal -->
	<div class="modal" id="pagamentoInferiorNull">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Pagamento insuficiente</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<p>Insira o valor do pagamento.</p>
				</div>
			</div>
		</div>
	</div>
	
	<!-- The Modal -->
	<div class="modal" id="finalizar">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Finalizar venda</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					Digite o CPF do cliente:
					<br><br>

							<input type="text" id="cpfClienteDinheiro" name="cpfClienteDinheiro" class="form-control" placeholder="Ex.: 000.000.000-00" onkeypress="return isNumberKey(event)" onkeydown="javascript: fMasc( this, mCPF );" maxlength="14">
						
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">

						<a id="btnFinalizarModal" href="#"
							class="btn btn-success" onclick="cpf();">Finalizar</a>
					<button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
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

	<script type="text/javascript">
	function cpf() {
		var cpf = document.getElementById("cpfClienteDinheiro").value;

		document.getElementById("btnFinalizarModal").href = "controller.do?command=DinheiroFinalizado&cpf="+cpf; 
	}
    	
	</script>
	
	<script type="text/javascript">
	function verificar() {
		var pagamento = ${valorRecebido };
		var total = document.getElementById("totalModal").value;
			
		if (pagamento >= total)
			$('#finalizar').modal('show');
		else if (pagamento != "")
			$('#pagamentoInferior').modal('show');
		else 
			$('#pagamentoInferiorNull').modal('show');
	}
    	
	</script>

</body>
</html>