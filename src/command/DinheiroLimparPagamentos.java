package command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DinheiroLimparPagamentos implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		DinheiroCalcularDesconto dcd = new DinheiroCalcularDesconto();
		dcd.executar(request, response);

	}

}
