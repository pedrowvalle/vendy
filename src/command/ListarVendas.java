package command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Pedido;
import service.PedidoService;


public class ListarVendas implements Command{
	
	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		ArrayList<Pedido> lista = null;
		PedidoService ps = new PedidoService();
		lista = ps.listarPedidos();
		request.setAttribute("lista", lista);
		
		RequestDispatcher view = request.getRequestDispatcher("Vendas/listagem_vendas.jsp");
		view.forward(request, response);

	}

}

