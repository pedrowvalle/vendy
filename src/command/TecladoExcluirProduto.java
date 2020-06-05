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

public class TecladoExcluirProduto implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Produto produto = new Produto();
		
		ProdutoService ps = new ProdutoService();
		RequestDispatcher view = null;
		HttpSession session = request.getSession();
		
		ArrayList<Produto> venda = (ArrayList<Produto>) session.getAttribute("venda");
		ArrayList<String> vendaAux = (ArrayList<String>) session.getAttribute("vendaAux");
		if(venda.size() == 1) {
			ArrayList<Produto> categorias = ps.listarCategorias();
			venda = new ArrayList<>();
			vendaAux = new ArrayList<>();
			String categoria = request.getParameter("categoria");
			ArrayList<Produto> produtos = ps.listarProdutoCategoria(categoria);
			double total = 0;
			session.setAttribute("produtos", produtos);
			session.setAttribute("categorias", categorias);
			session.setAttribute("venda", venda);
			session.setAttribute("vendaAux", vendaAux);
			session.setAttribute("total", total);
			view = request.getRequestDispatcher("caixa/teclado.jsp");
		}else {
			double total = Double.parseDouble(request.getParameter("total"));
			int cod = Integer.parseInt(request.getParameter("cod"));
			produto = ps.carregar(cod);
			int i = busca(produto, venda);
			total -= (venda.get(i).getPreco() * venda.get(i).getCont());
			venda.remove(i);
			vendaAux.remove(i);
			session.setAttribute("venda", venda);
			session.setAttribute("vendaAux", vendaAux);
			session.setAttribute("total", total);
			view = request.getRequestDispatcher("caixa/teclado.jsp");
		}
		
		
		view.forward(request, response);

	}
	
	public int busca(Produto produto, ArrayList<Produto> lista) {
		Produto p;
		for(int i = 0; i < lista.size(); i++) {
			p = lista.get(i);
			if(p.getCod() == produto.getCod()) {
				return i;
			}
		}
		return -1;
	}

}
