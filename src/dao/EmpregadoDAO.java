package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;

import model.Empregado;

public class EmpregadoDAO {
	
	public ArrayList <Empregado> listar (){
		String sql = "SELECT * FROM empregado";
		ArrayList <Empregado> empregados = new ArrayList <> ();
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sql);
					ResultSet rs = stm.executeQuery();){
			while(rs.next()) {
				Empregado emp = new Empregado();
				emp.setCpf(rs.getString("cpf"));
				emp.setNome(rs.getString("nome"));
				emp.setDt_nsc(rs.getString("dt_nsc"));
				emp.setUsuario(rs.getString("usuario"));
				emp.setSenha(rs.getString("senha"));
				if(rs.getInt("genero") == 1) {
					emp.setGenero("Masculino");
				}else if (rs.getInt("genero") == 2) {
					emp.setGenero("Feminino");
				} else {
					emp.setGenero("Outro");
				}
				emp.setTipo_emp(rs.getInt("tipo"));
				empregados.add(emp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return empregados;
	}
	
	public ArrayList<Empregado> listarEmpregado(String chave){
		Empregado emp;
		ArrayList<Empregado> lista = new ArrayList<>();
		String sqlSelect = "select * from empregado where upper(nome) like ?";
		try(Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect)){
			stm.setString(1,  "%"+chave.toUpperCase()+"%");
			try(ResultSet rs = stm.executeQuery()){
				while(rs.next()) {
					emp = new Empregado();
					emp.setCpf(rs.getString("cpf"));
					emp.setNome(rs.getString("nome"));
					emp.setDt_nsc(rs.getString("dt_nsc"));
					emp.setUsuario(rs.getString("usuario"));
					emp.setSenha(rs.getString("senha"));
					if(rs.getInt("genero") == 1) {
						emp.setGenero("Masculino");
					}else {
						emp.setGenero("Feminino");
					}
					emp.setTipo_emp(rs.getInt("tipo"));
					
					lista.add(emp);
				}
			}catch (SQLException e) {
					e.printStackTrace();
			}
		}catch (SQLException e1) {
				e1.printStackTrace();
		}
		return lista;
	}
	
	public Empregado incluir(Empregado emp) throws ParseException{
        String SQLInsert = "INSERT INTO empregado (cpf,genero,dt_nsc,nome,cnpj_comercio,usuario,senha,tipo) VALUES (?,?,?,?,?,?,?,?)";
        try(Connection conn = ConnectionFactory.obtemConexao();
                PreparedStatement stm = conn.prepareStatement(SQLInsert);){
            stm.setString(1, emp.getCpf());
            if(emp.getGenero().equals("m")) {
            	stm.setInt(2, 1);
            }else if (emp.getGenero().equals("f")) {
            	stm.setInt(2,  2);
            }else {
            	stm.setInt(2,  3);
            }
            stm.setString(3, emp.getDt_nsc());
            stm.setString(4, emp.getNome());
            stm.setString(5, "0123456789");
            stm.setString(6, emp.getUsuario());
            stm.setString(7, emp.getSenha());
            stm.setInt(8, emp.getTipo_emp());
            stm.execute();
        } catch (SQLException e) {
            e.printStackTrace();
           
        }
        return emp;
    }
	
	public void atualizar(Empregado emp) {
		String SQLUpdate = "UPDATE empregado SET genero=?,dt_nsc=?,nome=?,usuario=?,senha=?,tipo=? WHERE cpf=?";
		try(Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(SQLUpdate);){	
	            if(emp.getGenero().equals("m")) {
	            	stm.setInt(1, 1);
	            }else if (emp.getGenero().equals("f")) {
	            	stm.setInt(1,  2);
	            }else {
	            	stm.setInt(1,  3);
	            }
	            stm.setString(2, emp.getDt_nsc());
	            stm.setString(3, emp.getNome());
	            stm.setString(4, emp.getUsuario());
	            stm.setString(5, emp.getSenha());
	            stm.setInt(6, emp.getTipo_emp());
	            stm.setString(7, emp.getCpf());
	            stm.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void excluir(String cpf) {
		String SQLDelete = "DELETE FROM empregado WHERE cpf=?";
		try(Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(SQLDelete);){
			stm.setString(1, cpf);
			stm.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public Empregado carregar(String cpf) {
		String SQLSelect = "SELECT * FROM empregado WHERE empregado.cpf = ?";
		Empregado emp = new Empregado();
		try(Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(SQLSelect);){	
			stm.setString(1, cpf);
			try(ResultSet rs = stm.executeQuery();){
				if (rs.next()) {
					emp.setCpf(rs.getString("cpf"));
					if(rs.getInt("genero") == 1) {
						emp.setGenero("Masculino");
					}else if (rs.getInt("genero") == 2){
						emp.setGenero("Feminino");
					}else {
						emp.setGenero("Outro");
					}
					emp.setDt_nsc(rs.getString("dt_nsc"));
					emp.setNome(rs.getString("nome"));
					emp.setUsuario(rs.getString("usuario"));
					emp.setSenha(rs.getString("senha"));
					emp.setTipo_emp(rs.getInt("tipo"));
					
				} return emp;
			} catch (SQLException e) {
				e.printStackTrace();
				return null;
			}
		} catch (SQLException e1) {
			System.out.println(e1.getStackTrace());
			return null;
		}
		
		
		
		
	}
	public Empregado empregadoLogado(Empregado emp) {
        String sqlSelect = "select tipo,senha from empregado where usuario = ?";
        try (Connection conn = ConnectionFactory.obtemConexao();
                PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
            stm.setString(1,emp.getUsuario());
            try (ResultSet rs = stm.executeQuery();) {
                if (rs.next()) {
                    if(rs.getString("senha").equals(emp.getSenha())) {
                        emp.setTipo_emp(rs.getInt("tipo"));
                        return emp;
                    }else {
                        emp.setTipo_emp(-1);
                        return emp;
                    }
                }
            }catch (SQLException e) {
                System.out.print(e.getStackTrace());
            }
        } catch (SQLException e1) {
            System.out.print(e1.getStackTrace());
        }
        return emp;
    }

    public Empregado nomeEmpregado(Empregado emp) {
        String sqlSelect = "select nome from empregado where usuario=?";
        try(Connection conn = ConnectionFactory.obtemConexao();
                PreparedStatement stm = conn.prepareStatement(sqlSelect);){
            stm.setString(1,  emp.getUsuario());
            try(ResultSet rs = stm.executeQuery()){
                if(rs.next()) {
                    emp.setNome(rs.getString("nome"));
                }
            }catch (SQLException e) {
                System.out.println(e.getStackTrace());
            }
        }catch (SQLException e1) {
            System.out.println(e1.getStackTrace());
        }
        return emp;
    }
}
