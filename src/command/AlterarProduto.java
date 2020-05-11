package command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Produto;
import service.ProdutoService;

public class AlterarProduto implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Produto produto = new Produto();
		
		ProdutoService ps = new ProdutoService();
		RequestDispatcher view = null;
		HttpSession session = request.getSession();
		
		int cod = Integer.parseInt(request.getParameter("cod_produto"));
		String nomeProduto = request.getParameter("nome_produto");
		double preco = Double.parseDouble(request.getParameter("preco"));
		String categoria = request.getParameter("categoria");
		int estoque = Integer.parseInt(request.getParameter("estoque"));
		produto.setCod(cod);
		produto.setNome(nomeProduto);
		produto.setCategoria(categoria);
		produto.setPreco(preco);
		produto.setQuantidade(estoque);
		ps.atualizar(produto);
		session.setAttribute("produto", produto);
		view = request.getRequestDispatcher("produtos/consulta_produto_resultado.jsp");
		view.forward(request, response);

	}

}
