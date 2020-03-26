package service;

import dao.EmpregadoDAO;
import model.Empregado;

public class EmpregadoService {
	
	EmpregadoDAO dao = new EmpregadoDAO();
	
	public void tipoEmpregado (Empregado empregado) {
	dao.empregadoLogado(empregado);
	}
}
