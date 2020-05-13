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

public class IncluirProduto implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Produto produto = new Produto();
		
		ProdutoService ps = new ProdutoService();
		RequestDispatcher view = null;
		HttpSession session = request.getSession();
		
		String nomeProduto = request.getParameter("nome_produto");
		double preco = Double.parseDouble(request.getParameter("preco"));
		String categoria = request.getParameter("categoria");
		int estoque = Integer.parseInt(request.getParameter("estoque"));
		produto.setNome(nomeProduto);
		produto.setCategoria(categoria);
		produto.setPreco(preco);
		produto.setQuantidade(estoque);
		ps.incluir(produto);
		ArrayList<Produto> lista = ps.listarProdutos();
		lista.add(produto);
		session.setAttribute("produto", produto);
		session.setAttribute("listaProduto", lista);
		view = request.getRequestDispatcher("produtos/consulta_produto_resultado.jsp");
		view.forward(request, response);

		
		
	}

}
