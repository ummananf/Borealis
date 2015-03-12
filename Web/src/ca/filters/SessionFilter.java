package ca.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ca.session.SessionGlobals;

public class SessionFilter implements Filter {

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain filter) throws IOException, ServletException {
		
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        
        boolean isSessionActive = 
        		(request.getSession()
        				.getAttribute(SessionGlobals.CURRENT_SESSION_USER)) != null;
        boolean isLoginPage = request.getRequestURI().contains("login");
        
        System.out.println("FILTER: REQUEST URL: " + request.getRequestURI());
        System.out.println("isSessionActive: " + isSessionActive);
        System.out.println("isLoginPage: " + isLoginPage);
        
        if (isSessionActive || isLoginPage) {
        	filter.doFilter(request, response);
        } else {
        	response.sendRedirect("login");
        }
		
	}
	
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
