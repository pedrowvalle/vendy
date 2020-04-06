package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Produto;
import service.ProdutoService;

/**
 * Servlet implementation class ManterProdutoController
 */
@WebServlet("/ManterProduto")
public class ManterProdutoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManterProdutoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nomeProduto = request.getParameter("nome_produto");
		double precoProduto = Double.parseDouble(request.getParameter("preco"));
		String categoriaProduto = request.getParameter("categoria");
		int estoqueInicial = Integer.parseInt(request.getParameter("estoque"));
		
		Produto produto = new Produto(nomeProduto, categoriaProduto, precoProduto, estoqueInicial);
		ProdutoService ps = new ProdutoService();
		ps.incluir(produto);
		
		RequestDispatcher view = request.getRequestDispatcher("cadastro_produtos.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
