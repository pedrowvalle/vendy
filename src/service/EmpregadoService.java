package service;

import java.util.ArrayList;

import dao.EmpregadoDAO;
import model.Empregado;

public class EmpregadoService {
	private EmpregadoDAO dao;
	
	public EmpregadoService() {
		dao = new EmpregadoDAO();
	}
	
	public void incluir (Empregado emp) {
		dao.incluir(emp);
	}
	public void atualizar(Empregado emp) {
		dao.atualizar(emp);
	}
	public void excluir(String cpf) {
		dao.excluir(cpf);
	}
	public Empregado carregar(String cpf) {
		return dao.carregar(cpf);
	}

	public ArrayList <Empregado> listarEmpregados (){
		return dao.listar();
	}
	
	public ArrayList <Empregado> listarEmpregados (String chave){
		return dao.listarEmpregado(chave);
	}
	
	public void tipoEmpregado(Empregado empregado) {
		dao.empregadoLogado(empregado);
	}
	public void nomeEmpregado(Empregado empregado) {
		dao.nomeEmpregado(empregado);
	}
}