package command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Pedido;
import service.PedidoService;

public class VisualizarVenda implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Pedido pedido = new Pedido();
		
		PedidoService ps = new PedidoService();
		RequestDispatcher view = null;
		HttpSession session = request.getSession();
		
		int cod = Integer.parseInt(request.getParameter("cod"));
		pedido = ps.carregar(cod);
		String res = "";
		for(int i = 0; i < pedido.getCod_produto().length(); i++) {
			if(pedido.getCod_produto().charAt(i) == ';') {
				res += "\n";
			}else {
				res += pedido.getCod_produto().charAt(i);
			}
		}
		pedido.setCod_produto(res);
		session.setAttribute("pedido", pedido);
		view = request.getRequestDispatcher("Vendas/visualizar_venda.jsp");
		
		view.forward(request, response);

	}

}
