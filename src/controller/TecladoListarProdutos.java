package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Produto;
import service.ProdutoService;


@WebServlet("/TecladoListarProdutos")
public class TecladoListarProdutos extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public TecladoListarProdutos() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		ArrayList<Produto> categorias = null;
		ArrayList<Produto> produtos = null;
		ArrayList<Produto> venda = new ArrayList<>();
		String categoria = request.getParameter("categoria");
		ProdutoService ps = new ProdutoService();
		produtos = ps.listarProdutoCategoria(categoria);
		categorias = ps.listarCategorias();
		session.setAttribute("produtos", produtos);
		session.setAttribute("categorias", categorias);
		session.setAttribute("venda", venda);
		
		RequestDispatcher view = request.getRequestDispatcher("caixa/teclado.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
