package command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Produto;

public class DinheiroCalcularDesconto implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		RequestDispatcher view = null;
		ArrayList<Produto> venda = (ArrayList<Produto>) session.getAttribute("venda");
		session.setAttribute("venda", venda);
		
		session.setAttribute("totalDinheiroAux", null);
		session.setAttribute("resultado", null);
		session.setAttribute("valorRecebido", null);
		
		Double total = (Double) session.getAttribute("totalDinheiro");
		Double descReais = 0.0;
		if (!isNullOrBlank(request.getParameter("descReais")) && Double.parseDouble(request.getParameter("descReais")) <= total && isNullOrBlank(request.getParameter("descPorc"))) 
		{
			descReais = Double.parseDouble(request.getParameter("descReais").replaceFirst("^0+(?!$)", ""));
			descReais = round (descReais, 2);
		}
			
		Double descPorc = 0.0;
		if (!isNullOrBlank(request.getParameter("descPorc")) && total * (1 - (Double.parseDouble(request.getParameter("descPorc"))/100)) >= 0.0 && isNullOrBlank(request.getParameter("descReais"))) 
		{
			descPorc = Double.parseDouble(request.getParameter("descPorc").replaceFirst("^0+(?!$)", ""));
			descPorc = round (descPorc, 2);
		}
			
	
		if (descReais > 0.0 && descPorc == 0.0) 
		{
			if (total >= 0.0 && descReais <= total) 
			{
				total = round (total - descReais, 2);
				session.setAttribute("totalTitulo", "Total (com desconto)");
				session.setAttribute("totalDinheiro", total);
				view = request.getRequestDispatcher("caixa/finalizar-venda-dinheiro.jsp");
				view.forward(request, response);
			}
				
		}
		
		else if (descReais == 0.0 && descPorc > 0.0) 
		{
			if (total >= 0.0 && total * (1 - (descPorc/100)) >= 0.0) 
			{
				total = round(total * (1 - (descPorc/100)), 2);
				session.setAttribute("totalTitulo", "Total (com desconto)");
				session.setAttribute("totalDinheiro", total);
				view = request.getRequestDispatcher("caixa/finalizar-venda-dinheiro.jsp");
				view.forward(request, response);
			} 
				
		}
		else
		{
			view = request.getRequestDispatcher("caixa/finalizar-venda-dinheiro.jsp");
			view.forward(request, response);
		}	
			
	}
	public boolean isNullOrBlank(final String s) {
	    return s == null || s.trim().length() == 0;
	}
	public static double round(double value, int places) {
	    if (places < 0) throw new IllegalArgumentException();

	    long factor = (long) Math.pow(10, places);
	    value = value * factor;
	    long tmp = Math.round(value);
	    return (double) tmp / factor;
	}

}