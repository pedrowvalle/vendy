package service;

import dao.LoginDAO;
import model.Login;

public class LoginService {
	private LoginDAO dao= new LoginDAO();
	
	public void validacao(Login login) {
		dao.logar(login);
		if(login.getLogin().equals("admin")) {
			
			
		}else if(login.getLogin()!=null) {
			
			
		}
	}
}
