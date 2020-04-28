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

@WebServlet("/ManterTeclado")
public class ManterTecladoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ManterTecladoController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pAcao = request.getParameter("acao");
		Produto produto = new Produto();
		
		ProdutoService ps = new ProdutoService();
		RequestDispatcher view = null;
		HttpSession session = request.getSession();
		
		if(pAcao.equals("mostrarTeclado")) {
			int cod = Integer.parseInt(request.getParameter("cod"));
			produto = ps.carregar(cod);
			session.setAttribute("produto", produto);
			view = request.getRequestDispatcher("caixa/teclado.jsp");
		}else if(pAcao.equals("adicionar")) {
			int cod = Integer.parseInt(request.getParameter("cod"));
			ArrayList<Produto> venda = (ArrayList<Produto>) session.getAttribute("venda");
			produto = ps.carregar(cod);
			venda.add(produto);
			ArrayList<Produto> categorias = ps.listarCategorias();
			ArrayList<Produto> produtos = (ArrayList<Produto>) session.getAttribute("produtos");
			session.setAttribute("venda", venda);
			session.setAttribute("produtos", produtos);
			session.setAttribute("categorias", categorias);
			view = request.getRequestDispatcher("caixa/teclado.jsp");
		}else if(pAcao.equals("categoria")) {
			ArrayList<Produto> venda = (ArrayList<Produto>) session.getAttribute("venda");
			ArrayList<Produto> categorias = ps.listarCategorias();
			ArrayList<Produto> produtos = ps.listarProdutoCategoria(request.getParameter("categoria"));
			session.setAttribute("venda", venda);
			session.setAttribute("produtos", produtos);
			session.setAttribute("categorias", categorias);
			view = request.getRequestDispatcher("caixa/teclado.jsp");	
		}else if(pAcao.contentEquals("inicio")) {
			ArrayList<Produto> categorias = ps.listarCategorias();
			ArrayList<Produto> venda = new ArrayList<>();
			String categoria = request.getParameter("categoria");
			ArrayList<Produto> produtos = ps.listarProdutoCategoria(categoria);
			session.setAttribute("produtos", produtos);
			session.setAttribute("categorias", categorias);
			session.setAttribute("venda", venda);
			view = request.getRequestDispatcher("caixa/teclado.jsp");
		}else if (pAcao.equals("cancelar")) {
			
		}
		
		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
