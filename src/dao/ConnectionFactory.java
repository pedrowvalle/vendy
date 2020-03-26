package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {
	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		}catch (ClassNotFoundException e) {
			throw new RuntimeException(e);
		}
	}
	
	public static Connection obtemConexao() throws SQLException{
	
	String url = "jdbc:mysql://localhost:3306/vendy?useSSL=false&useTimezone=true&serverTimezone=UTC";
	
	return DriverManager.getConnection(url, "root", "");
	
	}

}
