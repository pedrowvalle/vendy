package command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Cliente;
import service.ClienteService;

public class ExcluirCliente implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ClienteService cs = new ClienteService();
		RequestDispatcher view = null;
		HttpSession session = request.getSession();
		
		String pCpf = request.getParameter("cpf_cliente_del");
		String aux=request.getParameter("cpf_aux_cliente");
		if (pCpf.equals(aux))
			cs.excluir(pCpf);
		ArrayList<Cliente> lista = cs.listarCliente();
		session.setAttribute("lista", lista);
		view = request.getRequestDispatcher("clientes/listagem_clientes.jsp");
		
		view.forward(request, response);

	}

}
