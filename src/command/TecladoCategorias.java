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

public class TecladoCategorias implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProdutoService ps = new ProdutoService();
		RequestDispatcher view = null;
		HttpSession session = request.getSession();
		
		ArrayList<Produto> venda = (ArrayList<Produto>) session.getAttribute("venda");
		ArrayList<Produto> categorias = ps.listarCategorias();
		ArrayList<Produto> produtos = ps.listarProdutoCategoria(request.getParameter("categoria"));
		session.setAttribute("venda", venda);
		session.setAttribute("produtos", produtos);
		session.setAttribute("categorias", categorias);
		session.setAttribute("totalDinheiroAux", null);
		session.setAttribute("resultado", "");
		view = request.getRequestDispatcher("caixa/teclado.jsp");
		

		
		view.forward(request, response);

	}

}
