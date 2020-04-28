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

@WebServlet("/TecladoListarCategorias")
public class TecladoListarCategorias extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public TecladoListarCategorias() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Produto> categorias = null;
		ProdutoService ps = new ProdutoService();
		categorias = ps.listarCategorias();
		request.setAttribute("categorias", categorias);
		
		RequestDispatcher view = request.getRequestDispatcher("caixa/teclado.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
