package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.Empregado;
import service.ProdutoService;
import model.Produto;

@WebFilter("/*")
public class LogFilter implements Filter {
	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// place your code here
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpServletRequest req = (HttpServletRequest)request;
		HttpSession session = req.getSession();
		Empregado emp = (Empregado)session.getAttribute("logado");
		ProdutoService pserv = new ProdutoService();
		Produto prod = new Produto();
		if(emp != null ) 
		{
			if (req.getParameter("command") != null) 
			{
				if (req.getParameter("command").equals("TecladoCategorias"))
					System.out.println(emp.getNome()+ " -> Categoria: " + req.getParameter("categoria"));
				else if (req.getParameter("command").equals("TecladoAddProduto")) 
				{
					prod = pserv.carregar(Integer.parseInt(req.getParameter("cod")));
					System.out.println(emp.getNome()+ " -> Add produto: " + prod.getNome());
				}
				else if (req.getParameter("command").equals("TecladoAumentarQtd")) 
				{
					prod = pserv.carregar(Integer.parseInt(req.getParameter("cod")));
					System.out.println(emp.getNome()+ " -> +1 " + prod.getNome());
				}
				else if (req.getParameter("command").equals("TecladoDiminuirQtd")) 
				{
					prod = pserv.carregar(Integer.parseInt(req.getParameter("cod")));
					System.out.println(emp.getNome()+ " -> -1 " + prod.getNome());
				}
				else if (req.getParameter("command").equals("TecladoExcluirProduto")) 
				{
					prod = pserv.carregar(Integer.parseInt(req.getParameter("cod")));
					System.out.println(emp.getNome()+ " -> Produto excluído: " + prod.getNome());
				}
				else
					System.out.println(emp.getNome()+ " -> " + req.getParameter("command"));
					
			}
				
		}
			
		chain.doFilter(request, response);
	}
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
