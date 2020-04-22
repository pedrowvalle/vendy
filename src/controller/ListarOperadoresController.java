package controller;

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


@WebServlet("/ListarOperadores")
public class ListarOperadoresController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ListarOperadoresController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Empregado> lista = null;
		ClienteService cs = new ClienteService();
		lista = es.listarEmpregados();
		request.setAttribute("lista", lista);
		
		RequestDispatcher view = request.getRequestDispatcher("operador/listagem_operadores.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
