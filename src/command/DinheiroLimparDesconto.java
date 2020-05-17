package command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class DinheiroLimparDesconto implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		FinalizarVendaDinheiro fvd = new FinalizarVendaDinheiro();
		fvd.executar(request, response);
	}

}
