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

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/Login.do")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pUser = request.getParameter("usuario");
		String pPsw = request.getParameter("senha");
		
		Empregado emp = new Empregado (pUser, pPsw);
		EmpregadoService es = new EmpregadoService();
		es.tipoEmpregado(emp);
		
		if(emp.getTipo_emp() == 1) {
			RequestDispatcher view = request.getRequestDispatcher("operador.jsp");
			view.forward(request, response);
		}else if(emp.getTipo_emp() == 2) {
			RequestDispatcher view = request.getRequestDispatcher("estoquista.jsp");
			view.forward(request, response);
		}else {
			RequestDispatcher view = request.getRequestDispatcher("senhaIncorreta.jsp");
			view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
