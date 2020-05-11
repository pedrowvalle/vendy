package command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Empregado;
import service.EmpregadoService;

public class ExcluirOperador implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		EmpregadoService es = new EmpregadoService();
		RequestDispatcher view = null;
		HttpSession session = request.getSession();
		
		String pCpf=request.getParameter("cpf_operador_del");
		es.excluir(pCpf);
		ArrayList<Empregado> lista = es.listarEmpregados();
		session.setAttribute("lista", lista);
		view = request.getRequestDispatcher("operadores/listagem_operadores.jsp");
		
		view.forward(request, response);

	}

}
