package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Pedido;

public class PedidoDAO {
	public int incluir(Pedido ped) {
		String SQLInsert = "INSERT INTO pedido (cod_produto,data_pedido,preco,cpf_cliente, desconto, vendedor) VALUES (?,?,?,?,?,?)";
		try(Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(SQLInsert);){
			stm.setString(1, ped.getCod_produto());
			stm.setString(2, ped.getData_pedido());
			stm.setDouble(3, ped.getPreco());
			stm.setString(4, ped.getCpf_cliente());
			stm.setDouble(5,  ped.getDesconto());
			stm.setString(6, ped.getVendedor());
			stm.execute();
			String sqlQuery = "SELECT LAST_INSERT_ID()";
			try (PreparedStatement stm2 = conn.prepareStatement(sqlQuery);
					ResultSet rs = stm2.executeQuery();) {
				if(rs.next()) {
					ped.setCod(rs.getInt(1));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	return ped.getCod();
	}
	
	public void atualizar(Pedido ped) {
		String SQLUpdate = "UPDATE pedido SET cod_produto = ?, data_pedido=? ,preco =?, cpf_cliente=? WHERE cod=?";
		try(Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(SQLUpdate);){
			stm.setString(1, ped.getCod_produto());
			stm.setString(2, ped.getData_pedido());
			stm.setDouble(3, ped.getPreco());
			stm.setString(4, ped.getCpf_cliente());
			stm.setInt(5, ped.getCod());
			stm.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void excluir(Pedido ped) {
		String SQLDelete = "DELETE FROM pedido WHERE cod=?";
		try(Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(SQLDelete);){
			stm.setInt(1, ped.getCod());
			
			stm.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public Pedido carregar(Pedido ped) {
		String SQLSelect = "SELECT * FROM pedido WHERE cod = ?";
		try(Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(SQLSelect);){
			stm.setInt(1, ped.getCod());
			try(ResultSet rs = stm.executeQuery();){
				if (rs.next()) {
					ped.setCod_produto(rs.getString("cod_produto"));
					ped.setData_pedido(rs.getString("data_pedido"));
					ped.setPreco(rs.getDouble("preco"));
					ped.setCpf_cliente(rs.getString("Cpf_cliente"));
					ped.setDesconto(rs.getDouble("desconto"));
					ped.setVendedor(rs.getString("vendedor"));
				} 
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.println(e1.getStackTrace());
		}
		
		return ped;
	}
	
	public Pedido carregar(int cod) {
		Pedido ped = new Pedido();
		String SQLSelect = "SELECT * FROM pedido WHERE cod = ?";
		try(Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(SQLSelect);){
			stm.setInt(1, cod);
			try(ResultSet rs = stm.executeQuery();){
				if (rs.next()) {
					ped.setCod_produto(rs.getString("cod_produto"));
					ped.setData_pedido(rs.getString("data_pedido"));
					ped.setPreco(rs.getDouble("preco"));
					ped.setCpf_cliente(rs.getString("Cpf_cliente"));
					ped.setDesconto(rs.getDouble("desconto"));
					ped.setVendedor(rs.getString("vendedor"));
				} 
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.println(e1.getStackTrace());
		}
		
		return ped;
	}
	
	public Pedido carregarPreco(int cod) {
		Pedido ped = new Pedido();
		String SQLSelect = "SELECT preco FROM pedido WHERE cod = ?";
		try(Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(SQLSelect);){
			stm.setInt(1, cod);
			try(ResultSet rs = stm.executeQuery();){
				if (rs.next()) {
					ped.setPreco(rs.getDouble("preco"));
				} 
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.println(e1.getStackTrace());
		}
		
		return ped;
	}
	
	public ArrayList<Pedido> listarPedidos(){
		Pedido ped;
		ArrayList<Pedido> lista = new ArrayList<>();
		String sqlSelect = "select * from pedido";
		try(Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect)){
			try(ResultSet rs = stm.executeQuery()){
				while(rs.next()) {
					ped = new Pedido();
					ped.setCod(rs.getInt("cod"));
					ped.setCod_produto(rs.getString("cod_produto"));
					ped.setData_pedido(rs.getString("data_pedido"));
					ped.setPreco(rs.getDouble("preco"));
					ped.setCpf_cliente(rs.getString("Cpf_cliente"));
					ped.setDesconto(rs.getDouble("desconto"));
					ped.setVendedor(rs.getString("vendedor"));
					lista.add(ped);
				}
			}catch (SQLException e) {
					e.printStackTrace();
				}
		}catch (SQLException e1) {
				e1.printStackTrace();
		}
		return lista;
	}
	
	public ArrayList<Pedido> listarPedido(String chave){
		Pedido ped;
		ArrayList<Pedido> lista = new ArrayList<>();
		String sqlSelect = "select * from pedido where upper(nome) like ?";
		try(Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect)){
			stm.setString(1,  "%"+chave.toUpperCase()+"%");
			try(ResultSet rs = stm.executeQuery()){
				while(rs.next()) {
					ped = new Pedido();
					ped.setCod(rs.getInt("cod"));
					ped.setCod_produto(rs.getString("cod_produto"));
					ped.setData_pedido(rs.getString("data_pedido"));
					ped.setPreco(rs.getDouble("preco"));
					ped.setCpf_cliente(rs.getString("Cpf_cliente"));
					ped.setDesconto(rs.getDouble("desconto"));
					ped.setVendedor(rs.getString("vendedor"));
					lista.add(ped);
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
