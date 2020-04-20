package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Operador;

public class OperadorDAO {
	
	public List <Operador> listar (){
		String sql = "SELECT * FROM ope";
		List <Operador> operadores = new ArrayList <> ();
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sql);
					ResultSet rs = stm.executeQuery();){
			while(rs.next()) {
				Operador ope = new Operador();
				ope.setId(rs.getInt("id"));
				ope.setCpf(rs.getString("cpf"));
				ope.setNome(rs.getString("nome"));
				ope.setDatan(rs.getString("datan"));
				ope.setUsuario(rs.getString("usuario"));
				ope.setSenha(rs.getString("senha"));
				operadores.add(ope);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return operadores;
	}
	
	public int incluir(Operador ope) {
		String SQLInsert = "INSERT INTO operador (cpf,nome,datan,usuario,senha) VALUES (?,?,?,?,?)";
		try(Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(SQLInsert);){
			stm.setString(1, ope.getCpf());
			stm.setString(2, ope.getNome());
			stm.setString(3, ope.getDatan());
			stm.setString(4, ope.getUsuario());
			stm.setString(5, ope.getSenha());
			stm.execute();
			String sqlQuery = "SELECT LAST_INSERT_ID()";
			try (PreparedStatement stm2 = conn.prepareStatement(sqlQuery);
					ResultSet rs = stm2.executeQuery();) {
				if(rs.next()) {
					ope.setId(rs.getInt(1));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	return ope.getId();
	}
	
	public void atualizar(Operador ope) {
		String SQLUpdate = "UPDATE operador cpf=?,nome=?,datan=?,usuario=?,senha=? WHERE id=?";
		try(Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(SQLUpdate);){
			stm.setString(1, ope.getCpf());
			stm.setString(2, ope.getNome());
			stm.setString(3, ope.getDatan());
			stm.setString(4, ope.getUsuario());
			stm.setString(5, ope.getSenha());
			stm.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void excluir(Operador ope) {
		String SQLDelete = "DELETE FROM operador WHERE id=?";
		try(Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(SQLDelete);){
			stm.setInt(1, ope.getId());
			
			stm.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public Operador carregar(Operador ope) {
		String SQLSelect = "SELECT * FROM operador WHERE ope.id = ?";
		try(Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(SQLSelect);){
			stm.setInt(1, ope.getId());
			try(ResultSet rs = stm.executeQuery();){
				if (rs.next()) {
					ope.setCpf(rs.getString("cpf"));
					ope.setNome(rs.getString("nome"));
					ope.setDatan(rs.getString("datan"));
					ope.setUsuario(rs.getString("usuario"));
					ope.setSenha(rs.getString("senha"));
				} 
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.println(e1.getStackTrace());
		}
		
		return ope;
	}
}
