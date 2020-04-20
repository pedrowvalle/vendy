package service;

import java.util.List;

import dao.OperadorDAO;
import model.Operador;

public class OperadorService {
	private OperadorDAO dao;
	
	public OperadorService() {
		dao = new OperadorDAO();
	}
	
	public int incluir (Operador ope) {
		return dao.incluir(ope);
	}
	public void atualizar(Operador ope) {
		dao.atualizar(ope);
	}
	public void excluir(Operador ope) {
		dao.excluir(ope);
	}
	public void excluir(int id) {
		dao.excluir(new Operador(id));
	}
	public Operador carregar(Operador ope) {
		return dao.carregar(ope);
	}
	public Operador carregar(int id) {
		return dao.carregar(new Operador (id));
	}
	public List <Operador> listar (){
		return dao.listar();
	}

}