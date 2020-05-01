package service;

import java.text.ParseException;

import dao.CategoriaDAO;
import model.Categoria;

public class CategoriaService {
private CategoriaDAO dao;
	
	public CategoriaService() {
		dao = new CategoriaDAO();
	}
	
	public int incluir (Categoria cat) throws ParseException {
		return dao.incluir(cat);
	}
	public void atualizar(Categoria cat) {
		dao.atualizar(cat);
	}
	public void excluir(Categoria cat) {
		dao.excluir(cat);
	}
	public Categoria carregar(int cod) {
		return dao.carregar(cod);
	}
	public String [] listarCategoria(){
		return dao.listarCategoria();
	}
}
