package model;

public class Empregado {
	private String cpf, nome, cnpj_comercio, usuario, senha, dt_nsc;
	String genero;
	int tipo;

	public Empregado (String cpf, String usuario, String senha) {
		setCpf(cpf);
		setUsuario(usuario);
		setSenha(senha);
	}
	
	public Empregado (String usuario, String senha) {
		setUsuario(usuario);
		setSenha(senha);
	}
	
	public Empregado (String cpf) {
		setCpf(cpf);
	}
	
	public Empregado() {
	}
	public int getTipo_emp() {
		return tipo;
	}
	public void setTipo_emp(int tipo_emp) {
		this.tipo = tipo_emp;
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
	public String getCnpj_comercio() {
		return cnpj_comercio;
	}
	public void setCnpj_comercio(String cnpj_comercio) {
		this.cnpj_comercio = cnpj_comercio;
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
	public String getDt_nsc() {
		return dt_nsc;
	}
	public void setDt_nsc(String dt_nsc) {
		this.dt_nsc = dt_nsc;
	}
	public String getGenero() {
		return genero;
	}
	public void setGenero(String genero) {
		this.genero = genero;
	}
}
