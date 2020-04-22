package model;


public class Empregado{
	private String cpf;
	private String nome;
	private String datan;
	private String usuario;
	private String senha;
	
	public Empregado(String cpf, String nome, String datan, String usuario, String senha) {
		this.cpf = cpf;
		this.nome = nome;
		this.datan = datan;
		this.usuario = usuario;
		this.senha = senha;
	}

	public Empregado() {

	}

	public Empregado(String cpf) {
		this.cpf = cpf;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getDatan() {
		return datan;
	}

	public void setDatan(String datan) {
		this.datan = datan;
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	@Override
	public String toString() {
		return "Operador [cpf=" + cpf + ", nome=" + nome + ", datan=" + datan + ", usuario=" + usuario
				+ ", senha=" + senha + "]";
	}
}

