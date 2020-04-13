package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import model.Cliente;
import model.Produto;

public class ClienteDAO {
	public Cliente incluir(Cliente cli) throws ParseException {
		java.sql.Date data;
		String SQLInsert = "INSERT INTO cliente (cpf,nome,dt_nsc,genero) VALUES (?,?,?,?)";
		DateFormat fmt = new SimpleDateFormat("dd/MM/yyyy");
		data = new java.sql.Date(fmt.parse(cli.getDatan()).getTime());
		try(Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(SQLInsert);){
			stm.setString(1, cli.getCpf());
			stm.setString(2, cli.getNome());
			stm.setDate(3, data);
			stm.setString(4, cli.getSexo());
			stm.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	return cli;
	}
	
	public void atualizar(Cliente cli) {
		String SQLUpdate = "UPDATE cliente nome=?,dt_nsc=?,genero=? WHERE cpf=?";
		try(Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(SQLUpdate);){
			stm.setString(1, cli.getCpf());
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
			stm.setString(1, cli.getCpf());
			stm.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public Cliente carregar(Cliente cli) {
		String SQLSelect = "SELECT * FROM cliente WHERE cliente.cpf = ?";
		try(Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(SQLSelect);){
			stm.setString(1, cli.getCpf());
			try(ResultSet rs = stm.executeQuery();){
				if (rs.next()) {
					cli.setNome(rs.getString("nome"));
					cli.setDatan(rs.getString("dt_nsc"));
					cli.setSexo(rs.getString("genero"));
				} 
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.println(e1.getStackTrace());
		}
		
		return cli;
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
					cli.setDatan(rs.getString("dt_nsc"));
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