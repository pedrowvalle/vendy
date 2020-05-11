package command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Cliente;
import service.ClienteService;

public class VisualizarCliente implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String nomeCliente = request.getParameter("nome_cliente");
		String cpfCliente = request.getParameter("cpf_cliente");
		String dtNsc = request.getParameter("dt_nsc");
		String genero = request.getParameter("genero");
		
		Cliente cliente = new Cliente(cpfCliente, nomeCliente, dtNsc, genero);
		ClienteService cs = new ClienteService();
		RequestDispatcher view = null;
		HttpSession session = request.getSession();
		
		String pCpf=request.getParameter("cpf_cliente");
		cliente = cs.carregar(pCpf);
		session.setAttribute("cliente", cliente);
		view = request.getRequestDispatcher("clientes/consulta_clientes_resultado.jsp");
		
		view.forward(request, response);

	}

}
