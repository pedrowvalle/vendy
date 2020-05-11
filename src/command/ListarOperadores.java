package command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Empregado;
import service.ClienteService;
import service.EmpregadoService;

public class ListarOperadores implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<Empregado> lista = null;
		EmpregadoService es = new EmpregadoService();
		lista = es.listarEmpregados();
		request.setAttribute("lista", lista);
		
		RequestDispatcher view = request.getRequestDispatcher("operadores/listagem_operadores.jsp");
		view.forward(request, response);

	}

}
