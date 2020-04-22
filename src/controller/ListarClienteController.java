package controller;

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

@WebServlet("/ListarClientes")
public class ListarClienteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ListarClienteController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Cliente> lista = null;
		ClienteService cs = new ClienteService();
		lista = cs.listarCliente();
		request.setAttribute("lista", lista);
		
		RequestDispatcher view = request.getRequestDispatcher("clientes/listagem_clientes.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
