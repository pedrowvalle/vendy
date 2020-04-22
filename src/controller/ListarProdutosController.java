package controller;

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

@WebServlet("/ListarProdutos")
public class ListarProdutosController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ListarProdutosController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Produto> lista = null;
		ProdutoService ps = new ProdutoService();
		lista = ps.listarProdutos();
		request.setAttribute("lista", lista);
		
		RequestDispatcher view = request.getRequestDispatcher("produtos/listagem_produtos.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
