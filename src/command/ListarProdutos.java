package command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Produto;
import service.ProdutoService;

public class ListarProdutos implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<Produto> lista = null;
		ProdutoService ps = new ProdutoService();
		lista = ps.listarProdutos();
		request.setAttribute("lista", lista);
		
		RequestDispatcher view = request.getRequestDispatcher("produtos/listagem_produtos.jsp");
		view.forward(request, response);

	}

}
