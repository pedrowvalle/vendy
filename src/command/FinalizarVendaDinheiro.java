package command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Produto;

public class FinalizarVendaDinheiro implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		RequestDispatcher view = null;
		ArrayList<Produto> venda = (ArrayList<Produto>) session.getAttribute("venda");
		session.setAttribute("totalTitulo", "Total");
		session.setAttribute("venda", venda);
		Object total = session.getAttribute("total");
		session.setAttribute("totalDinheiro", total);
		
		session.setAttribute("totalDinheiroAux", null);
		session.setAttribute("resultado", "");
		
		view = request.getRequestDispatcher("caixa/finalizar-venda-dinheiro.jsp");
		
		view.forward(request, response);

	}

}
