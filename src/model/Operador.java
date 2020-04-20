package model;


public class Operador{
	private int id;
	private String cpf;
	private String nome;
	private String datan;
	private String usuario;
	private String senha;
	
	public Operador(int id, String cpf, String nome, String datan, String usuario, String senha) {
		super();
		this.id = id;
		this.cpf = cpf;
		this.nome = nome;
		this.datan = datan;
		this.usuario = usuario;
		this.senha = senha;
	}

	public Operador() {

	}

	public Operador(int id) {
		super();
		this.id = id;
	}

	public Operador(String cpf) {
		super();
		this.cpf = cpf;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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
		return "Operador [id=" + id + ", cpf=" + cpf + ", nome=" + nome + ", datan=" + datan + ", usuario=" + usuario
				+ ", senha=" + senha + "]";
	}
}

