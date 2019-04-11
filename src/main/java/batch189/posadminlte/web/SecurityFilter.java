package batch189.posadminlte.web;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * @author Awiyanto Ajisasongko
 *
 */
public class SecurityFilter implements Filter {
	private Log log = LogFactory.getLog(getClass());

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		log.debug("Check username in session");
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession(true);
		if (session.getAttribute("nama")==null) {
			if (req.getRequestURL().indexOf("login.do")>=0) chain.doFilter(request, response);
			else req.getRequestDispatcher("/login.html").forward(request, response);
		} else {
			chain.doFilter(request, response);
		}
	}

	@Override
	public void destroy() {
	}
}