package command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		es.nomeEmpregado(emp);

		if(emp.getTipo_emp() == 1) {
			HttpSession sessionOp = request.getSession();
			sessionOp.setAttribute("logado", emp);
			request.setAttribute("operador", emp);
			RequestDispatcher view = request.getRequestDispatcher("operador.jsp");
			view.forward(request, response);
			System.out.println("Operador(a) "+emp.getNome()+" logou");

		}else if(emp.getTipo_emp() == 2) {
			HttpSession sessionEs = request.getSession();
			sessionEs.setAttribute("logado", emp);
			request.setAttribute("estoquista", emp);
			RequestDispatcher view = request.getRequestDispatcher("estoquista.jsp");
			view.forward(request, response);
			System.out.println("Estoquista "+emp.getNome()+" logou");
		}else {
			RequestDispatcher view = request.getRequestDispatcher("index.jsp");
			view.forward(request, response);
		}

	}

}
