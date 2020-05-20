package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Empregado;

@WebFilter("/controller.do")
public class LoginFilter implements Filter {

    public LoginFilter() {
    }
    
	FilterConfig filterConfig = null;

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		String path = req.getContextPath();
		String uri = req.getRequestURI();
		String comando = req.getParameter("command");
		Empregado emp = (Empregado)session.getAttribute("logado");
		ServletContext servletContext = filterConfig.getServletContext();
		
		if(comando == null) {
			comando = "";
		}else if (comando.equals("Logoff")) {
			
		}
		
		if (emp == null && !uri.equals(path + "/index.jsp")
				&& !comando.equals("Login")) {
			((HttpServletResponse) response).sendRedirect(path + "/index.jsp");
		}else if(emp != null && emp.getTipo_emp() == 1 &&
				!(comando.equals("DinheiroCalcularDesconto") || comando.equals("DinheiroCalcularTroco") || comando.equals("DinheiroFinalizado") || comando.equals("DinheiroImprimirNota") ||
						comando.equals("DinheiroLimparDesconto") || comando.equals("DinheiroLimparPagamentos") || comando.equals("FinalizarVenda") || comando.equals("FinalizarVendaDinheiro") ||
						comando.equals("TecladoAddProduto") || comando.equals("TecladoAumentarQtd") || comando.equals("TecladoCategorias") || comando.equals("TecladoDiminuirQtd") ||
						comando.equals("TecladoExcluirProduto") || comando.equals("TecladoInicio") || comando.equals("TecladoListarCategorias") || comando.equals("TecladoListarProdutos") ||
						comando.equals("TecladoMostrar") || comando.equals("Logoff"))) {
			System.out.println("empregado tipo " + emp.getTipo_emp());
			((HttpServletResponse) response).sendRedirect(path + "/sempermissao.jsp");
			
		}else if(emp != null && emp.getTipo_emp() == 2 &&
				!(comando.equals("AlterarCliente") || comando.equals("AlterarOperador") || comando.equals("AlterarProduto") || comando.equals("EditarCliente") ||
						comando.equals("EditarOperador") || comando.equals("EditarProduto") || comando.equals("ExcluirCliente") || comando.equals("ExcluirOperador") ||
						comando.equals("ExcluirProduto") || comando.equals("IncluirCliente") || comando.equals("IncluirOperador") || comando.equals("IncluirProduto") ||
						comando.equals("ListarClientes") || comando.equals("ListarOperadores") || comando.equals("ListarProdutos") || comando.equals("ListarVendas") ||
						comando.equals("VisualizarCliente") || comando.equals("VisualizarOperador") || comando.equals("VisualizarProduto") || comando.equals("VisualizarVenda")
						 || comando.equals("Logoff"))) {
			System.out.println("empregado tipo " + emp.getTipo_emp());
			((HttpServletResponse) response).sendRedirect(path + "/sempermissao.jsp");
			
		}else {
			chain.doFilter(request, response);
		}
		
	}

	public void init(FilterConfig fConfig) throws ServletException {
		this.filterConfig = fConfig;
	}

}
