package dao;

import java.sql.*;

import model.Empregado;


public class EmpregadoDAO {

	public Empregado empregadoLogado(Empregado emp) {
		String sqlSelect = "select tipo_empregado,senha from empregado where usuario=?";
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			stm.setString(1,emp.getUsuario());
			try (ResultSet rs = stm.executeQuery();) {
				if (rs.next()) {
					if(rs.getString("senha").equals(emp.getSenha())) {
						emp.setTipo_emp(rs.getInt("tipo_empregado"));
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
}
