package service;

import dao.ProdutoDAO;
import model.Produto;

public class ProdutoService {
	private ProdutoDAO dao;
	
	public ProdutoService() {
		dao = new ProdutoDAO();
	}
	
	public int incluir (Produto prod) {
		return dao.incluir(prod);
	}
	public void atualizar(Produto prod) {
		dao.atualizar(prod);
	}
	public void excluir(Produto prod) {
		dao.excluir(prod);
	}
	public void excluir(int id) {
		dao.excluir(new Produto(id));
	}
	public Produto carregar(Produto prod) {
		return dao.carregar(prod);
	}
	public Produto carregar(int id) {
		return dao.carregar(new Produto (id));
	}
}