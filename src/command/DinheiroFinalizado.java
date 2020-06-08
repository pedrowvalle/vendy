package command;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Empregado;
import model.Pedido;
import model.Produto;
import service.PedidoService;
import service.ProdutoService;
import utils.Recibo;

public class DinheiroFinalizado implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher view = null;
		HttpSession session = request.getSession();
		
		ProdutoService prodServ = new ProdutoService();
		
		Double total = (Double)session.getAttribute("total");
		String totalS = String.format("%.2f", total);
		session.setAttribute("total", totalS);
		
		Double desconto = (Double)session.getAttribute("totalDinheiro");
		Double calculo = total-desconto;
		String calculoS = String.format("%.2f", calculo);
		session.setAttribute("valorDescontado", calculoS);
		
		Object cpf = request.getParameter("cpf");
		session.setAttribute("cpfClienteFinalizado", cpf);
		
		Double recebido = (Double)session.getAttribute("valorRecebido");
		String recebidoS = String.format("%.2f", recebido);
		session.setAttribute("valorRecebidoFormat", recebidoS);
		
		Double troco = (Double)session.getAttribute("valorTroco");
		String trocoS = String.format("%.2f", troco);
		session.setAttribute("trocoFormat", trocoS);
		
		
		
		
		Empregado emp = (Empregado)session.getAttribute("logado");
		ArrayList <Produto> venda = (ArrayList<Produto>) session.getAttribute("venda");
		String produtos = "";
		java.util.Date date = new java.util.Date();
		
		ServletContext context = request.getServletContext();
		String textoRecibo = "";
		String textoProdutos = "";
		String contextPath = context.getRealPath(File.separator);

		textoRecibo = String
				.format("RECIBO\n\nData: %s\n\nPRODUTOS:\n\n",
						date.toString());
		textoRecibo+="==================================\n";
		produtos="";
		for(Produto p : venda) {
			produtos += p.getNome();
			produtos += "( " + p.getCont() + " )";
			produtos += ";";
			textoProdutos += String.format(" - %d   %s   %.2f\n", p.getCont(), p.getNome(), p.getPreco());

			prodServ.atualizarEstoque(p);

		}
		textoProdutos+="==================================";
		Pedido pedido = new Pedido();
		pedido.setCod_produto(produtos);
		pedido.setCpf_cliente(cpf.toString());
		pedido.setPreco(total);
		pedido.setData_pedido(date.toString());
		pedido.setDesconto(total-desconto);
		pedido.setVendedor(emp.getNome());
		
		PedidoService ps = new PedidoService();
		ps.incluir(pedido);
		
		textoRecibo += String.format("%s\n\nTOTAL: R$ %.2f\nDESCONTO: R$ %.2f\n\nVALOR PAGO: R$ %.2f\nTROCO: R$ %.2f\n\nCPF: %s", textoProdutos, total, total-desconto, recebido, troco, cpf.toString());
		
		
		synchronized (textoRecibo) {
			if (textoRecibo!= "") 
			{
				Recibo recibo = new Recibo();
				recibo.abrir(contextPath + File.separator + "recibo" + File.separator + Recibo.NOME);
				recibo.escrever(textoRecibo);
				recibo.fechar();
			}
		}
		
		session.setAttribute("reciboPath", contextPath+File.separator+"recibo"+File.separator+Recibo.NOME);

		view = request.getRequestDispatcher("caixa/venda-finalizada-dinheiro.jsp");
		view.forward(request, response);

	}
	public static double round(double value, int places) {
	    if (places < 0) throw new IllegalArgumentException();

	    long factor = (long) Math.pow(10, places);
	    value = value * factor;
	    long tmp = Math.round(value);
	    return (double) tmp / factor;
	}
}
