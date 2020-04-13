package model;


public class Cliente{
	private String cpf;
	private String nome;
	private String datan;
	private String sexo;
	
	public Cliente () {}
	
	public Cliente(String cpf, String nome, String datan, String sexo) {
		this.cpf = cpf;
		this.nome = nome;
		this.datan = datan;
		this.sexo = sexo;
	}

	public Cliente(String cpf) {
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

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}


	@Override
	public String toString() {
		return "Cliente [cpf=" + cpf + ", nome=" + nome + ", datan=" + datan + ", sexo=" + sexo + "]";
	}
}

