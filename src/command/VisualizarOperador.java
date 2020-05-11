package command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Empregado;
import service.EmpregadoService;

public class VisualizarOperador implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Empregado empregado = new Empregado();
		EmpregadoService es = new EmpregadoService();
		RequestDispatcher view = null;
		HttpSession session = request.getSession();
		
		String pCpf=request.getParameter("cpf_operador");
		empregado = es.carregar(pCpf);
		session.setAttribute("empregado", empregado);
		view = request.getRequestDispatcher("operadores/consulta_operadores_resultado.jsp");
		
		view.forward(request, response);

	}

}
