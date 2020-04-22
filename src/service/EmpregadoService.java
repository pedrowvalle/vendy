package service;

import java.util.List;

import dao.EmpregadoDAO;
import model.Empregado;

public class EmpregadoService {
	private EmpregadoDAO dao;
	
	public EmpregadoService() {
		dao = new EmpregadoDAO();
	}
	
	public String incluir (Empregado emp) {
		return dao.incluir(emp);
	}
	public void atualizar(Empregado emp) {
		dao.atualizar(emp);
	}
	public void excluir(Empregado emp) {
		dao.excluir(emp);
	}
	public void excluir(String cpf) {
		dao.excluir(new Empregado(cpf));
	}
	public Empregado carregar(Empregado emp) {
		return dao.carregar(emp);
	}
	public Empregado carregar(String cpf) {
		return dao.carregar(new Empregado (cpf));
	}
	public List <Empregado> listar (){
		return dao.listar();
	}

}