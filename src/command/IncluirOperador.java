package command;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Empregado;
import service.EmpregadoService;

public class IncluirOperador implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Empregado empregado = new Empregado();
		EmpregadoService es = new EmpregadoService();
		RequestDispatcher view = null;
		HttpSession session = request.getSession();
		
		String nome = request.getParameter("nome_operador");
		String cpf = request.getParameter("cpf_operador");
		String dtNsc = request.getParameter("dt_nsc");
		String genero = request.getParameter("genero");
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		empregado = es.carregar(cpf);
		session.setAttribute("empregado", empregado);
		view = request.getRequestDispatcher("operadores/consulta_operadores_resultado.jsp");
		
		view.forward(request, response);

	}

}
