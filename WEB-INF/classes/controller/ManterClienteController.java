package controller;


import java.io.IOException;
import java.text.ParseException;
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


@WebServlet("/ManterCliente")
public class ManterClienteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ManterClienteController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pAcao = request.getParameter("acao");
		String nomeCliente = request.getParameter("nome_cliente");
		String cpfCliente = request.getParameter("cpf_cliente");
		String dtNsc = request.getParameter("dt_nsc");
		String genero = request.getParameter("genero");
		
		Cliente cliente = new Cliente(cpfCliente, nomeCliente, dtNsc, genero);
		ClienteService cs = new ClienteService();
		RequestDispatcher view = null;
		HttpSession session = request.getSession();
		
		if (pAcao.equals("incluir")) {
			try {
				cs.incluir(cliente);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			ArrayList<Cliente> lista = cs.listarCliente();
			lista.add(cliente);
			session.setAttribute("lista", lista);
			session.setAttribute("cliente", cliente);
			view = request.getRequestDispatcher("clientes/consulta_clientes_resultado.jsp");
		}else if (pAcao.equals("excluir")) {
			String pCpf = request.getParameter("cpf_cliente_del");
			cs.excluir(pCpf);
			ArrayList<Cliente> lista = cs.listarCliente();
			session.setAttribute("lista", lista);
			view = request.getRequestDispatcher("clientes/listagem_clientes.jsp");
		}else if (pAcao.equals("alterar")) {
			cs.atualizar(cliente);
			session.setAttribute("cliente", cliente);
			view = request.getRequestDispatcher("clientes/consulta_clientes_resultado.jsp");
		}else if (pAcao.equals("visualizar")) {
			String pCpf=request.getParameter("cpf_cliente");
			cliente = cs.carregar(pCpf);
			session.setAttribute("cliente", cliente);
			view = request.getRequestDispatcher("clientes/consulta_clientes_resultado.jsp");
		}else if (pAcao.equals("editar")) {
			cliente = cs.carregar(cliente.getCpf());
			session.setAttribute("cliente", cliente);
			view = request.getRequestDispatcher("clientes/alteracao_cliente_formulario.jsp");
		}
		view.forward(request, response);
	}
	
	public int busca (Cliente cliente, ArrayList<Cliente> lista) {
		Cliente cli;
		for (int i = 0; i < lista.size(); i++) {
			cli = lista.get(i);
			if(cli.getCpf().equals(cliente.getCpf()))
				return i;
		}
		return -1;
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
