package model;


public class Produto{
	private int cod;
	private String nome;
	private String categoria;
	private double preco;
	private int quantidade;
	private int cont;
	private String precoString;
	
	public Produto() {}
	
	public Produto(int cod, String nome, String categoria, double preco, int quantidade) {
		this.cod = cod;
		this.nome = nome;
		this.categoria = categoria;
		this.preco = preco;
		this.quantidade = quantidade;
		setPrecoString(String.format("%.2f", preco));
	}
	
	public Produto(String nome, String categoria, double preco, int quantidade) {
		this.nome = nome;
		this.categoria = categoria;
		this.preco = preco;
		this.quantidade = quantidade;
	}
	
	public Produto(String categoria) {
		this.categoria = categoria;
	}

	public Produto(int cod) {
		this.cod = cod;
	}

	public int getCod() {
		return cod;
	}

	public void setCod(int cod) {
		this.cod = cod;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCategoria() {
		return categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

	public double getPreco() {
		return preco;
	}

	public void setPreco(double preco) {
		this.preco = preco;
	}

	public int getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}

	@Override
	public String toString() {
		return "Produto [cod=" + cod + ", nome=" + nome + ", categoria=" + categoria + ", preco=" + preco
				+ ", quantidade=" + quantidade + "]";
	}

	public int getCont() {
		return cont;
	}

	public void setCont(int cont) {
		this.cont = cont;
	}

	public String getPrecoString() {
		return precoString;
	}

	public void setPrecoString(String precoString) {
		this.precoString = precoString;
	}
	
	
}

