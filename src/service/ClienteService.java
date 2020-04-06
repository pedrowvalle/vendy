package service;

import java.text.ParseException;

import dao.ClienteDAO;
import model.Cliente;

public class ClienteService {
	private ClienteDAO dao;
	
	public ClienteService() {
		dao = new ClienteDAO();
	}
	
	public Cliente incluir (Cliente cli) throws ParseException {
		return dao.incluir(cli);
	}
	public void atualizar(Cliente cli) {
		dao.atualizar(cli);
	}
	public void excluir(Cliente cli) {
		dao.excluir(cli);
	}
	public void excluir(String cpf) {
		dao.excluir(new Cliente(cpf));
	}
	public Cliente carregar(Cliente cli) {
		return dao.carregar(cli);
	}
	public Cliente carregar(String cpf) {
		return dao.carregar(new Cliente (cpf));
	}
}