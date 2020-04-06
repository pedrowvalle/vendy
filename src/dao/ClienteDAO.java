package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Cliente;

public class ClienteDAO {
	public Cliente incluir(Cliente cli) {
		String SQLInsert = "INSERT INTO cliente (cpf,nome,datan,sexo) VALUES (?,?,?,?)";
		try(Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(SQLInsert);){
			stm.setLong(1, cli.getCpf());
			stm.setString(2, cli.getNome());
			stm.setString(3, cli.getDatan());
			stm.setString(4, cli.getSexo());
			stm.execute();
			String sqlQuery = "SELECT LAST_INSERT_ID()";
			try (PreparedStatement stm2 = conn.prepareStatement(sqlQuery);
					ResultSet rs = stm2.executeQuery();) {
				if(rs.next()) {
					cli.setId(rs.getInt(1));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	return cli;
	}
	
	public void atualizar(Cliente cli) {
		String SQLUpdate = "UPDATE cliente nome=?,datan=?,sexo=? WHERE cpf=?";
		try(Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(SQLUpdate);){
			stm.setLong(1, cli.getCpf());
			stm.setString(2, cli.getNome());
			stm.setString(3, cli.getDatan());
			stm.setString(4, cli.getSexo());
			stm.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void excluir(Cliente cli) {
		String SQLDelete = "DELETE FROM cliente WHERE cpf=?";
		try(Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(SQLDelete);){
			stm.setLong(1, cli.getCpf());
			stm.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public Cliente carregar(Cliente cli) {
		String SQLSelect = "SELECT * FROM cliente WHERE cliente.cpf = ?";
		try(Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(SQLSelect);){
			stm.setLong(1, cli.getCpf());
			try(ResultSet rs = stm.executeQuery();){
				if (rs.next()) {
					cli.setNome(rs.getString("nome"));
					cli.setDatan(rs.getString("datan"));
					cli.setSexo(rs.getString("sexo"));
				} 
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.println(e1.getStackTrace());
		}
		
		return cli;
	}
}