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

import org.apache.taglibs.standard.extra.spath.ParseException;

import model.Produto;
import service.ProdutoService;

@WebServlet("/ManterProduto")
public class ManterProdutoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ManterProdutoController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pAcao = request.getParameter("acao");
		Produto produto = new Produto();
		
		ProdutoService ps = new ProdutoService();
		RequestDispatcher view = null;
		HttpSession session = request.getSession();
		
		if(pAcao.equals("incluir")) {
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
		}else if(pAcao.equals("excluir")) {
			int pCod = Integer.parseInt(request.getParameter("cod_produto_del"));
			ps.excluir(pCod);
			ArrayList<Produto> lista = null;
			lista = ps.listarProdutos();
			request.setAttribute("lista", lista);
			view = request.getRequestDispatcher("produtos/listagem_produtos.jsp");
		}else if(pAcao.equals("alterar")) {
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
		}else if(pAcao.equals("visualizar")) {
			int cod = Integer.parseInt(request.getParameter("cod"));
			produto = ps.carregar(cod);
			session.setAttribute("produto", produto);
			view = request.getRequestDispatcher("produtos/consulta_produto_resultado.jsp");
		}else if(pAcao.equals("editar")) {
			int cod = Integer.parseInt(request.getParameter("cod"));
			produto = ps.carregar(cod);
			session.setAttribute("produto", produto);
			view = request.getRequestDispatcher("produtos/alteracao_produto_formulario.jsp");
		}
		
		view.forward(request, response);
	}
	
	public int busca (Produto cliente, ArrayList<Produto> lista) {
		Produto cli;
		for (int i = 0; i < lista.size(); i++) {
			cli = lista.get(i);
			if(cli.getCod() == cliente.getCod())
				return i;
		}
		return -1;
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
