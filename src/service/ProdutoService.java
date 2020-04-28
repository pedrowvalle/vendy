package service;

import java.util.ArrayList;

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
	public void excluir(int id) {
		dao.excluir(new Produto(id));
	}
	public Produto carregar(int id) {
		return dao.carregar(id);
	}
	
	
	public ArrayList<Produto> listarProdutos(){
		return dao.listarProduto();
	}
	
	public ArrayList<Produto> listarProdutos(String chave){
		return dao.listarProduto(chave);
	}
	
	public String [] listarCategoria(){
		return dao.listarCategoria();
	}
	
	public ArrayList<Produto> listarCategorias(){
		return dao.listarCategorias();
	}
	
	public ArrayList<Produto> listarProdutoCategoria(String categoria){
		return dao.listarProdutoCategoria(categoria);
	}

}