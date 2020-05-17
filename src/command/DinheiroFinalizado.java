package command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DinheiroFinalizado implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher view = null;
		HttpSession session = request.getSession();
		Object total = session.getAttribute("total");
		session.setAttribute("total", total);
		view = request.getRequestDispatcher("caixa/venda-finalizada-dinheiro.jsp");
		
		view.forward(request, response);

	}

}
