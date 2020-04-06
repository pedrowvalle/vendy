package controller;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cliente;
import service.ClienteService;

/**
 * Servlet implementation class ManterClienteController
 */
@WebServlet("/ManterCliente")
public class ManterClienteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManterClienteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nomeCliente = request.getParameter("nome_cliente");
		String cpfCliente = request.getParameter("cpf_cliente");
		String dtNsc = request.getParameter("dt_nsc");
		String genero = request.getParameter("genero");
		
		Cliente cliente = new Cliente(cpfCliente, nomeCliente, dtNsc, genero);
		ClienteService cs = new ClienteService();
		try {
			cs.incluir(cliente);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		RequestDispatcher view = request.getRequestDispatcher("cadastro_clientes.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
