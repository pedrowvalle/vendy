package command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Empregado;
import service.EmpregadoService;

public class Login implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pUser = request.getParameter("usuario");
		String pPsw = request.getParameter("senha");
		
		Empregado emp = new Empregado (pUser, pPsw);
		EmpregadoService es = new EmpregadoService();
		es.tipoEmpregado(emp);

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

}
