package command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Empregado;
import model.Pedido;
import model.Produto;
import service.PedidoService;

public class DinheiroFinalizado implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher view = null;
		HttpSession session = request.getSession();
		
		Double total = (Double)session.getAttribute("total");
		session.setAttribute("total", total);
		
		Double desconto = (Double)session.getAttribute("totalDinheiro");
		session.setAttribute("valorDescontado", total-desconto);
		
		Object cpf = request.getParameter("cpf");
		session.setAttribute("cpfClienteFinalizado", cpf);
		
		Empregado emp = (Empregado)session.getAttribute("logado");
		ArrayList <Produto> venda = (ArrayList<Produto>) session.getAttribute("venda");
		String produtos = "";
		java.util.Date date = new java.util.Date();
		for(Produto p : venda) {
			produtos += p.getNome();
			produtos += "( " + p.getCont() + " )";
			produtos += ";";
		}
		Pedido pedido = new Pedido();
		pedido.setCod_produto(produtos);
		pedido.setCpf_cliente(cpf.toString());
		pedido.setPreco(total);
		pedido.setData_pedido(date.toString());
		pedido.setDesconto(total-desconto);
		pedido.setVendedor(emp.getNome());
		
		PedidoService ps = new PedidoService();
		ps.incluir(pedido);
		
		view = request.getRequestDispatcher("caixa/venda-finalizada-dinheiro.jsp");
		view.forward(request, response);

	}
}
