package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Produto;

public class ProdutoDAO {
	public int incluir(Produto prod) {
		String SQLInsert = "INSERT INTO produto (nome,categoria,preco,estoque) VALUES (?,?,?,?)";
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
					prod.setCod(rs.getInt(1));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	return prod.getCod();
	}
	
	public void atualizar(Produto prod) {
		String SQLUpdate = "UPDATE produto SET nome=?,categoria=?,preco=?,estoque=? WHERE cod=?";
		try(Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(SQLUpdate);){
			stm.setString(1, prod.getNome());
			stm.setString(2, prod.getCategoria());
			stm.setDouble(3, prod.getPreco());
			stm.setInt(4, prod.getQuantidade());
			stm.setInt(5, prod.getCod());
			stm.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void excluir(Produto prod) {
		String SQLDelete = "DELETE FROM produto WHERE cod=?";
		try(Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(SQLDelete);){
			stm.setInt(1, prod.getCod());
			
			stm.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public Produto carregar(Produto prod) {
		String SQLSelect = "SELECT * FROM produto WHERE cod = ?";
		try(Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(SQLSelect);){
			stm.setInt(1, prod.getCod());
			try(ResultSet rs = stm.executeQuery();){
				if (rs.next()) {
					prod.setNome(rs.getString("nome"));
					prod.setCategoria(rs.getString("categoria"));
					prod.setPreco(rs.getDouble("preco"));
					prod.setQuantidade(rs.getInt("estoque"));
				} 
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.println(e1.getStackTrace());
		}
		
		return prod;
	}
	
	public Produto carregar(int cod) {
		Produto prod = new Produto();
		String SQLSelect = "SELECT * FROM produto WHERE cod = ?";
		try(Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(SQLSelect);){
			stm.setInt(1, cod);
			try(ResultSet rs = stm.executeQuery();){
				if (rs.next()) {
					prod.setCod(rs.getInt("cod"));
					prod.setNome(rs.getString("nome"));
					prod.setCategoria(rs.getString("categoria"));
					prod.setPreco(rs.getDouble("preco"));
					prod.setQuantidade(rs.getInt("estoque"));
				} 
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.println(e1.getStackTrace());
		}
		
		return prod;
	}
	
	public ArrayList<Produto> listarProduto(){
		Produto prod;
		ArrayList<Produto> lista = new ArrayList<>();
		String sqlSelect = "select * from produto";
		try(Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect)){
			try(ResultSet rs = stm.executeQuery()){
				while(rs.next()) {
					prod = new Produto();
					prod.setCod(rs.getInt("cod"));
					prod.setNome(rs.getString("nome"));
					prod.setCategoria(rs.getString("categoria"));
					prod.setPreco(rs.getDouble("preco"));
					prod.setQuantidade(rs.getInt("estoque"));
					lista.add(prod);
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
