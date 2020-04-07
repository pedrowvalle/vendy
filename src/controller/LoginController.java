package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Empregado;
import service.EmpregadoService;

@WebServlet("/Login.do")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoginController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pUser = request.getParameter("usuario");
		String pPsw = request.getParameter("senha");
		
		Empregado emp = new Empregado (pUser, pPsw);
		EmpregadoService es = new EmpregadoService();
		es.tipoEmpregado(emp);
		
		//empregado tipo 1 = operador de caixa
		//empregado tipo 2 = estoquista (retaguarda)
		//empregado tipo -1 = usuário ou senha incorretos
		if(emp.getTipo_emp() == 1) {
			RequestDispatcher view = request.getRequestDispatcher("operador.jsp");
			view.forward(request, response);
		}else if(emp.getTipo_emp() == 2) {
			es.nomeEmpregado(emp);
			request.setAttribute("estoquista", emp);
			RequestDispatcher view = request.getRequestDispatcher("estoquista.jsp");
			view.forward(request, response);
		}else {
			RequestDispatcher view = request.getRequestDispatcher("senhaIncorreta.jsp");
			view.forward(request, response);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
