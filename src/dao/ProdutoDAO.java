package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Produto;

public class ProdutoDAO {
	public int incluir(Produto prod) {
		String SQLInsert = "INSERT INTO produto (nome,categoria,preco,quantidade) VALUES (?,?,?,?)";
		try(Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(SQLInsert);){
			stm.setString(1, prod.getNome());
			stm.setString(2, prod.getCategoria());
			stm.setDouble(3, prod.getPreco());
			stm.setInt(4, prod.getQuantidade());
			stm.execute();
			String sqlQuery = "SELECT LAST_INSERT_ID()";
			try (PreparedStatement stm2 = conn.prepareStatement(sqlQuery);
					ResultSet rs = stm2.executeQuery();) {
				if(rs.next()) {
					prod.setId(rs.getInt(1));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	return prod.getId();
	}
	
	public void atualizar(Produto prod) {
		String SQLUpdate = "UPDATE produto nome=?,categoria=?,preco=?,quantidade=? WHERE id=?";
		try(Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(SQLUpdate);){
			stm.setString(1, prod.getNome());
			stm.setString(2, prod.getCategoria());
			stm.setDouble(3, prod.getPreco());
			stm.setInt(4, prod.getQuantidade());
			stm.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void excluir(Produto prod) {
		String SQLDelete = "DELETE FROM produto WHERE id=?";
		try(Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(SQLDelete);){
			stm.setInt(1, prod.getId());
			
			stm.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public Produto carregar(Produto prod) {
		String SQLSelect = "SELECT * FROM produto WHERE produto.id = ?";
		try(Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(SQLSelect);){
			stm.setInt(1, prod.getId());
			try(ResultSet rs = stm.executeQuery();){
				if (rs.next()) {
					prod.setNome(rs.getString("nome"));
					prod.setCategoria(rs.getString("categoria"));
					prod.setPreco(rs.getDouble("preco"));
					prod.setQuantidade(rs.getInt("quantidade"));
				} 
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.println(e1.getStackTrace());
		}
		
		return prod;
	}
}
