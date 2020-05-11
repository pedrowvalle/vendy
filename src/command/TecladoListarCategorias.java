package command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Produto;
import service.ProdutoService;

public class TecladoListarCategorias implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<Produto> categorias = null;
		ProdutoService ps = new ProdutoService();
		categorias = ps.listarCategorias();
		request.setAttribute("categorias", categorias);
		
		RequestDispatcher view = request.getRequestDispatcher("caixa/teclado.jsp");
		view.forward(request, response);

	}

}
