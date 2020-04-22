package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Empregado;

public class EmpregadoDAO {
	
	public List <Empregado> listar (){
		String sql = "SELECT * FROM empregado";
		List <Empregado> empregados = new ArrayList <> ();
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sql);
					ResultSet rs = stm.executeQuery();){
			while(rs.next()) {
				Empregado emp = new Empregado();
				emp.setCpf(rs.getString("cpf"));
				emp.setNome(rs.getString("nome"));
				emp.setDatan(rs.getString("datan"));
				emp.setUsuario(rs.getString("usuario"));
				emp.setSenha(rs.getString("senha"));
				empregados.add(emp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return empregados;
	}
	
	public String incluir(Empregado emp) {
		String SQLInsert = "INSERT INTO empregado (cpf,nome,datan,usuario,senha) VALUES (?,?,?,?,?)";
		try(Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(SQLInsert);){
			stm.setString(1, emp.getCpf());
			stm.setString(2, emp.getNome());
			stm.setString(3, emp.getDatan());
			stm.setString(4, emp.getUsuario());
			stm.setString(5, emp.getSenha());
			stm.execute();
			String sqlQuery = "SELECT LAST_INSERT_ID()";
			try (PreparedStatement stm2 = conn.prepareStatement(sqlQuery);
					ResultSet rs = stm2.executeQuery();) {
				if(rs.next()) {
					emp.setCpf(rs.getString(1));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	return emp.getCpf();
	}
	
	public void atualizar(Empregado emp) {
		String SQLUpdate = "UPDATE empregado nome=?,datan=?,usuario=?,senha=? WHERE cpf=?";
		try(Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(SQLUpdate);){
			stm.setString(1, emp.getCpf());
			stm.setString(2, emp.getNome());
			stm.setString(3, emp.getDatan());
			stm.setString(4, emp.getUsuario());
			stm.setString(5, emp.getSenha());
			stm.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void excluir(Empregado emp) {
		String SQLDelete = "DELETE FROM empregado WHERE cpf=?";
		try(Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(SQLDelete);){
			stm.setString(1, emp.getCpf());
			
			stm.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public Empregado carregar(Empregado emp) {
		String SQLSelect = "SELECT * FROM empregado WHERE empregado.cpf = ?";
		try(Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(SQLSelect);){
			stm.setString(1, emp.getCpf());
			try(ResultSet rs = stm.executeQuery();){
				if (rs.next()) {
					emp.setCpf(rs.getString("cpf"));
					emp.setNome(rs.getString("nome"));
					emp.setDatan(rs.getString("datan"));
					emp.setUsuario(rs.getString("usuario"));
					emp.setSenha(rs.getString("senha"));
				} 
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.println(e1.getStackTrace());
		}
		
		return emp;
	}
}
