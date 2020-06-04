package command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Produto;
import service.ProdutoService;

public class TecladoAddProduto implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Produto produto = new Produto();
		
		ProdutoService ps = new ProdutoService();
		RequestDispatcher view = null;
		HttpSession session = request.getSession();
		
		double total = Double.parseDouble(request.getParameter("total"));
		int cod = Integer.parseInt(request.getParameter("cod"));
		int cont = Integer.parseInt(request.getParameter("cont"));
		ArrayList<Produto> venda = (ArrayList<Produto>) session.getAttribute("venda");
		produto = ps.carregar(cod);
		if (produto.getQuantidade() > 0) 
		{
			produto.setCont(1);
			venda.add(produto);
			total += produto.getPreco();

		}
		ArrayList<Produto> categorias = ps.listarCategorias();
		ArrayList<Produto> produtos = (ArrayList<Produto>) session.getAttribute("produtos");
		session.setAttribute("venda", venda);
		session.setAttribute("produtos", produtos);
		session.setAttribute("categorias", categorias);
		session.setAttribute("total", total);
		session.setAttribute("cont", cont);
		view = request.getRequestDispatcher("caixa/teclado.jsp");
		
		view.forward(request, response);

	}

}
