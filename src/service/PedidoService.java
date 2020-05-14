package service;

import java.util.ArrayList;

import dao.PedidoDAO;
import model.Pedido;

public class PedidoService {
	private PedidoDAO dao;
	
	public PedidoService() {
		dao = new PedidoDAO();
	}
	
	public int incluir (Pedido ped) {
		return dao.incluir(ped);
	}
	public void atualizar(Pedido ped) {
		dao.atualizar(ped);
	}
	public void excluir(int id) {
		dao.excluir(new Pedido(id));
	}
	public Pedido carregar(int id) {
		return dao.carregar(id);
	}
	
	public Pedido carregarPreco(int id) {
		return dao.carregarPreco(id);
	}
	
	
	public ArrayList<Pedido> listarPedidos(){
		return dao.listarPedidos();
	}
	
	public ArrayList<Pedido> listarPedido(String chave){
		return dao.listarPedido(chave);
	}

}