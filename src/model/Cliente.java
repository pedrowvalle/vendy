package model;


public class Cliente{
	private int id;
	private long cpf;
	private String nome;
	private String datan;
	private String sexo;
	
	public Cliente(int id, long cpf, String nome, String datan, String sexo) {
		this.id = id;
		this.cpf = cpf;
		this.nome = nome;
		this.datan = datan;
		this.sexo = sexo;
	}

	public Cliente(long cpf) {
		this.cpf = cpf;
	}
	
	public Cliente(int id) {
		this.id = id;
	}

	public long getCpf() {
		return cpf;
	}

	public void setCpf(long cpf) {
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

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "Cliente [id=" + id + ", cpf=" + cpf + ", nome=" + nome + ", datan=" + datan + ", sexo=" + sexo + "]";
	}
}

