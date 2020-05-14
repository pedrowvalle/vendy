package model;

public class Pedido{
	private int cod;
	private int cod_produto;
	private String data_pedido;
	private double preco;
	private int cod_operador;
	private String cpf_cliente;
	
	public Pedido(int cod, int cod_produto, String data_pedido, double preco, int cod_operador, String cpf_cliente) {
		this.cod = cod;
		this.cod_produto = cod_produto;
		this.data_pedido = data_pedido;
		this.preco = preco;
		this.cod_operador = cod_operador;
		this.cpf_cliente = cpf_cliente;
	}

	public Pedido() {
	}

	public Pedido(int cod) {
		this.cod = cod;
	}

	public int getCod() {
		return cod;
	}

	public void setCod(int cod) {
		this.cod = cod;
	}

	public int getCod_produto() {
		return cod_produto;
	}

	public void setCod_produto(int cod_produto) {
		this.cod_produto = cod_produto;
	}

	public String getData_pedido() {
		return data_pedido;
	}

	public void setData_pedido(String data_pedido) {
		this.data_pedido = data_pedido;
	}

	public double getPreco() {
		return preco;
	}

	public void setPreco(double preco) {
		this.preco = preco;
	}

	public int getCod_operador() {
		return cod_operador;
	}

	public void setCod_operador(int cod_operador) {
		this.cod_operador = cod_operador;
	}

	public String getCpf_cliente() {
		return cpf_cliente;
	}

	public void setCpf_cliente(String cpf_cliente) {
		this.cpf_cliente = cpf_cliente;
	}

	@Override
	public String toString() {
		return "Pedido [cod=" + cod + ", cod_produto=" + cod_produto + ", data_pedido=" + data_pedido + ", preco="
				+ preco + ", cod_operador=" + cod_operador + ", cpf_cliente=" + cpf_cliente + "]";
	}
	
	
}
