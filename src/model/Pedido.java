package model;

public class Pedido{
	private int cod;
	private String cod_produto;
	private String data_pedido;
	private double preco;
	private String cpf_cliente;
	private double desconto;
	private String vendedor;
	
	public Pedido(int cod, String cod_produto, String data_pedido, double preco, int cod_operador, String cpf_cliente) {
		this.cod = cod;
		this.cod_produto = cod_produto;
		this.data_pedido = data_pedido;
		this.preco = preco;
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

	public String getCod_produto() {
		return cod_produto;
	}

	public void setCod_produto(String cod_produto) {
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

	public String getCpf_cliente() {
		return cpf_cliente;
	}

	public void setCpf_cliente(String cpf_cliente) {
		this.cpf_cliente = cpf_cliente;
	}
	
	

	@Override
	public String toString() {
		return "Pedido [cod=" + cod + ", cod_produto=" + cod_produto + ", data_pedido=" + data_pedido + ", preco="
				+ preco + ", cpf_cliente=" + cpf_cliente + "]";
	}

	public double getDesconto() {
		return desconto;
	}

	public void setDesconto(double desconto) {
		this.desconto = desconto;
	}

	public String getVendedor() {
		return vendedor;
	}

	public void setVendedor(String vendedor) {
		this.vendedor = vendedor;
	}
	
	
}
