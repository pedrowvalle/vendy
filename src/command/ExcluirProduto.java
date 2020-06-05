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

public class ExcluirProduto implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProdutoService ps = new ProdutoService();
		RequestDispatcher view = null;
		
		int pCod = Integer.parseInt(request.getParameter("cod_produto_del"));
		int aux= Integer.parseInt(request.getParameter("cod_aux"));
		if (pCod == aux)
			ps.excluir(pCod);
		ArrayList<Produto> lista = null;
		lista = ps.listarProdutos();
		request.setAttribute("lista", lista);
		view = request.getRequestDispatcher("produtos/listagem_produtos.jsp");
		view.forward(request, response);

	}

}
