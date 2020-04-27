package service;

import java.text.ParseException;
import java.util.ArrayList;

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
	public void excluir(String cpf) {
		dao.excluir(cpf);
	}
	public Cliente carregar(String cpf) {
		return dao.carregar(cpf);
	}
	public ArrayList<Cliente> listarCliente (){
		return dao.listarCliente();
	}
	public ArrayList<Cliente> listarCliente (String chave){
		return dao.listarCliente(chave);
	}
}