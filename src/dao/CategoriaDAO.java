package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Categoria;

public class CategoriaDAO {
	public int incluir(Categoria cat) {
		String SQLInsert = "INSERT INTO categoria (nome) VALUES (?)";
		try(Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(SQLInsert);){
			stm.setString(1, cat.getNome());
			stm.execute();
			String sqlQuery = "SELECT LAST_INSERT_ID()";
			try (PreparedStatement stm2 = conn.prepareStatement(sqlQuery);
					ResultSet rs = stm2.executeQuery();) {
				if(rs.next()) {
					cat.setCod(rs.getInt(1));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	return cat.getCod();
	}
	
	public void atualizar(Categoria cat) {
		String SQLUpdate = "UPDATE categoria SET nome=? WHERE cod=?";
		try(Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(SQLUpdate);){
			stm.setString(1, cat.getNome());
			stm.setInt(2, cat.getCod());
			stm.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void excluir(Categoria cat) {
		String SQLDelete = "DELETE FROM categoria WHERE cod=?";
		try(Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(SQLDelete);){
			stm.setInt(1, cat.getCod());
			stm.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public Categoria carregar(Categoria cat) {
		String SQLSelect = "SELECT * FROM categoria WHERE cod = ?";
		try(Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(SQLSelect);){
			stm.setInt(1, cat.getCod());
			try(ResultSet rs = stm.executeQuery();){
				if (rs.next()) {
					cat.setNome(rs.getString("nome"));
				} 
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.println(e1.getStackTrace());
		}
		
		return cat;
	}
	
	public Categoria carregar(int cod) {
		Categoria cat = new Categoria();
		String SQLSelect = "SELECT * FROM categoria WHERE cod = ?";
		try(Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(SQLSelect);){
			stm.setInt(1, cod);
			try(ResultSet rs = stm.executeQuery();){
				if (rs.next()) {
					cat.setCod(rs.getInt("cod"));
					cat.setNome(rs.getString("nome"));
				} 
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.println(e1.getStackTrace());
		}
		
		return cat;
	}
		
	public String[] listarCategoria(){
		String lista [] = new String [8];
		String sqlSelect = "SELECT DISTINCT categoria FROM produto";
		try(Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect)){
			try(ResultSet rs = stm.executeQuery()){
				for(int i =0; rs.next();i++) {
						lista [i] = rs.getString("categoria");
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
