package command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Produto;


public class TecladoAumentarQtd implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher view = null;
		HttpSession session = request.getSession();
		
		ArrayList<Produto> venda = (ArrayList<Produto>) session.getAttribute("venda");
		int cod = Integer.parseInt(request.getParameter("cod"));
		double total = 0;
		for (Produto prod : venda) {
			if (prod.getCod() == cod) {
				int aux = prod.getCont();
				aux++;
				prod.setCont(aux);
			}
			total += prod.getPreco() * prod.getCont();
		}
		session.setAttribute("venda", venda);
		session.setAttribute("total", total);
		view = request.getRequestDispatcher("caixa/teclado.jsp");
		
		
		view.forward(request, response);

	}

}
