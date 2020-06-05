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

public class TecladoInicio implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProdutoService ps = new ProdutoService();
		RequestDispatcher view = null;
		HttpSession session = request.getSession();
		
		ArrayList<Produto> categorias = ps.listarCategorias();
		ArrayList<Produto> venda = new ArrayList<>();
		ArrayList<String> vendaAux = new ArrayList<>();
		String categoria = request.getParameter("categoria");
		ArrayList<Produto> produtos = ps.listarProdutoCategoria(categoria);
		double total = 0;
		session.setAttribute("produtos", produtos);
		session.setAttribute("categorias", categorias);
		session.setAttribute("venda", venda);
		session.setAttribute("vendaAux", vendaAux);
		session.setAttribute("total", total);
		session.setAttribute("valorRecebido", null);
		session.setAttribute("valorTroco", null);
		view = request.getRequestDispatcher("caixa/teclado.jsp");
		
		view.forward(request, response);

	}

}
