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
import model.Empregado;
import service.ClienteService;
import service.EmpregadoService;


@WebServlet("/ManterOperador")
public class ManterOperadorController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ManterOperadorController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pAcao = request.getParameter("acao");
		
		Empregado empregado = new Empregado();
		EmpregadoService es = new EmpregadoService();
		RequestDispatcher view = null;
		HttpSession session = request.getSession();
		
		if (pAcao.equals("incluir")) {
			String nome = request.getParameter("nome_operador");
			String cpf = request.getParameter("cpf_operador");
			String dtNsc = request.getParameter("dt_nsc");
			char genero = request.getParameter("genero").charAt(0);
			String usuario = request.getParameter("usuario");
			String senha = request.getParameter("senha");
			String tipo = request.getParameter("tipo");
			int tipoOp;
			
			if(tipo.equals("Operador")) {
				tipoOp = 1;
			}else {
				tipoOp = 2;
			}
			
			empregado.setNome(nome);
			empregado.setCpf(cpf);
			empregado.setDt_nsc(dtNsc);
			empregado.setGenero(genero);
			empregado.setUsuario(usuario);
			empregado.setSenha(senha);
			empregado.setTipo_emp(tipoOp);
			
			try {
				es.incluir(empregado);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			session.setAttribute("empregado", empregado);
			view = request.getRequestDispatcher("operadores/consulta_operadores_resultado.jsp");
		}else if (pAcao.equals("excluir")) {
			es.excluir(empregado.getCpf());
			ArrayList<Cliente> lista = es.listarEmpregado();
			session.setAttribute("lista", lista);
			view = request.getRequestDispatcher("operadores/listagem_operadores.jsp");
		}else if (pAcao.equals("alterar")) {
			es.atualizar(empregado);
			session.setAttribute("empregado", empregado);
			view = request.getRequestDispatcher("operadores/consulta_operadores_resultado.jsp");
		}else if (pAcao.equals("visualizar")) {
			empregado = es.carregar(empregado.getCpf());
			session.setAttribute("empregado", empregado);
			view = request.getRequestDispatcher("operadores/consulta_operadores_resultado.jsp");
		}else if (pAcao.equals("editar")) {
			empregado = es.carregar(empregado.getCpf());
			session.setAttribute("empregado", empregado);
			view = request.getRequestDispatcher("operadores/alteracao_operadores_formulario.jsp");
		}
		view.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
