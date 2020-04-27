package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;

import model.Cliente;

public class ClienteDAO {
	public Cliente incluir(Cliente cli) throws ParseException {
		String SQLInsert = "INSERT INTO cliente (cpf,nome,dt_nsc,genero) VALUES (?,?,?,?)";
		try(Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(SQLInsert);){
			stm.setString(1, cli.getCpf());
			stm.setString(2, cli.getNome());
			stm.setString(3, cli.getDt_nsc());
			stm.setString(4, cli.getSexo());
			stm.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	return cli;
	}
	
	public void atualizar(Cliente cli) {
		String SQLUpdate = "UPDATE cliente SET nome=?,dt_nsc=?,genero=? WHERE cpf=?";
		try(Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(SQLUpdate);){
			stm.setString(1, cli.getNome());
			stm.setString(2, cli.getDt_nsc());
			stm.setString(3, cli.getSexo());
			stm.setString(4, cli.getCpf());
			stm.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void excluir(String cpf) {
		String SQLDelete = "DELETE FROM cliente WHERE cpf=?";
		try(Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(SQLDelete);){
			stm.setString(1, cpf);
			stm.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public Cliente carregar(String cpf) {
		String SQLSelect = "SELECT * FROM cliente WHERE cliente.cpf = ?";
		try(Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(SQLSelect);){
			stm.setString(1, cpf);
			try(ResultSet rs = stm.executeQuery();){
				Cliente cli = new Cliente();
				if (rs.next()) {
					cli.setCpf(rs.getString("cpf"));
					cli.setNome(rs.getString("nome"));
					cli.setDt_nsc(rs.getString("dt_nsc"));
					cli.setSexo(rs.getString("genero"));
				} return cli;
			} catch (SQLException e) {
				e.printStackTrace();
				return null;
			}
		} catch (SQLException e1) {
			System.out.println(e1.getStackTrace());
			return null;
		}
	}
	
	public ArrayList<Cliente> listarCliente(){
		Cliente cli;
		ArrayList<Cliente> lista = new ArrayList<>();
		String sqlSelect = "select * from cliente";
		try(Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect)){
			try(ResultSet rs = stm.executeQuery()){
				while(rs.next()) {
					cli = new Cliente();
					cli.setCpf(rs.getString("cpf"));
					cli.setNome(rs.getString("nome"));
					cli.setDt_nsc(rs.getString("dt_nsc"));
					cli.setSexo(rs.getString("genero"));
					lista.add(cli);
				}
			}catch (SQLException e) {
					e.printStackTrace();
				}
		}catch (SQLException e1) {
				e1.printStackTrace();
		}
		return lista;
	}
	
	public ArrayList<Cliente> listarCliente(String chave){
		Cliente cli;
		ArrayList<Cliente> lista = new ArrayList<>();
		String sqlSelect = "select * from cliente where upper (nome) like ?";
		try(Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect)){
			stm.setString(1,  "%"+chave.toUpperCase()+"%");
			try(ResultSet rs = stm.executeQuery()){
				while(rs.next()) {
					cli = new Cliente();
					cli.setCpf(rs.getString("cpf"));
					cli.setNome(rs.getString("nome"));
					cli.setDt_nsc(rs.getString("dt_nsc"));
					cli.setSexo(rs.getString("genero"));
					lista.add(cli);
				}
			}catch (SQLException e) {
					e.printStackTrace();
				}
		}catch (SQLException e1) {
				e1.printStackTrace();
		}
		return lista;
	}
}