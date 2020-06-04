package command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Produto;

public class DinheiroCalcularTroco implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		RequestDispatcher view = null;
		ArrayList<Produto> venda = (ArrayList<Produto>) session.getAttribute("venda");
		session.setAttribute("venda", venda);

		Double totalAux = (Double) session.getAttribute("totalDinheiro");
		session.setAttribute("totalDinheiro", totalAux);
		
		if (session.getAttribute("totalDinheiroAux") == null)
			session.setAttribute("totalDinheiroAux", totalAux);
		
		Double total = (Double) session.getAttribute("totalDinheiroAux");
		
		
		Double pagamento = 0.0;
		if (!isNullOrBlank(request.getParameter("pagamento"))) 
		{
			pagamento = Double.parseDouble(request.getParameter("pagamento").replaceFirst("^0+(?!$)", ""));
			pagamento = round (pagamento, 2);
		} 
			
		
		
		Double totalPagamento = 0.0;
		if (session.getAttribute("valorRecebido") != null) 
		{
			totalPagamento = (Double) session.getAttribute("valorRecebido");
			totalPagamento = round (totalPagamento, 2);
		}
			
		
		
		if (pagamento > 0.0) 
		{

			if (pagamento < total) 
			{
				total = round (total - pagamento, 2);
				totalPagamento = round (totalPagamento + pagamento, 2);
				session.setAttribute("resultadoTitulo", "Falta: ");
				session.setAttribute("resultado", "R$ "+total);
				session.setAttribute("valorRecebido", totalPagamento);

				view = request.getRequestDispatcher("caixa/finalizar-venda-dinheiro.jsp");
				view.forward(request, response);
			}
			else if (pagamento >= total) 
			{
				total = round (total - pagamento, 2);
				totalPagamento = round (totalPagamento + pagamento, 2);
				Double totalModulo = Math.abs(total);
				
				session.setAttribute("resultado", "R$ "+totalModulo);
				session.setAttribute("resultadoTitulo", "Troco: ");
				session.setAttribute("valorRecebido", totalPagamento);
				session.setAttribute("valorTroco", totalModulo);
				view = request.getRequestDispatcher("caixa/finalizar-venda-dinheiro.jsp");
				view.forward(request, response);
			}
			
			session.setAttribute("totalDinheiroAux", total);
			
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