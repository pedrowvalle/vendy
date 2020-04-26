package model;


public class Cliente{
	private String cpf;
	private String nome;
	private String dt_nsc;
	private String sexo;
	
	public Cliente () {}
	
	public Cliente(String cpf, String nome, String dt_nsc, String sexo) {
		this.cpf = cpf;
		this.nome = nome;
		this.dt_nsc = dt_nsc;
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

	public String getDt_nsc() {
		return dt_nsc;
	}

	public void setDt_nsc(String dt_nsc) {
		this.dt_nsc = dt_nsc;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}


	@Override
	public String toString() {
		return "Cliente [cpf=" + cpf + ", nome=" + nome + ", dt_nsc=" + dt_nsc + ", sexo=" + sexo + "]";
	}
}

