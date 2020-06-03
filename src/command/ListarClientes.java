package command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Cliente;
import service.ClienteService;

public class ListarClientes implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String chave = request.getParameter("data[search]");
		ArrayList<Cliente> lista = null;
		ClienteService cs = new ClienteService();
		if (chave != null && chave.length() > 0) {
			lista = cs.listarCliente(chave);
		}else {
			lista = cs.listarCliente();
		}
		request.setAttribute("lista", lista);
		
		RequestDispatcher view = request.getRequestDispatcher("clientes/listagem_clientes.jsp");
		view.forward(request, response);

	}

}
