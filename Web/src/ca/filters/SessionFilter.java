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

public class SessionFilter implements Filter
 {

	public void init(FilterConfig arg0) throws ServletException 
        {
	}

	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain filter) throws IOException, ServletException 
        {
		
                HttpServletRequest request = (HttpServletRequest) req;
                HttpServletResponse response = (HttpServletResponse) res;
                
                String uri = request.getRequestURI();
                
                String iosheader = ((String)request.getAttribute("IOS"));
                boolean isIos = false;
                if (iosheader != null) {
                	isIos = true;
                }
                boolean sessionActived = false;
                if(null != request.getSession())
                {
                	sessionActived = null != (request.getSession()
            				.getAttribute(SessionGlobals.CURRENT_SESSION_USER));
                }
                

                boolean isSessionActive = 
                		sessionActived || isIos;
                boolean isLoginPage = uri.contains("login");
                boolean isImage = uri.contains(".jpg") || uri.contains(".png");
                boolean isCSS = uri.contains(".css");
                boolean isJS = uri.contains(".js");
                boolean isJSP = uri.contains(".jsp");
                boolean isJSTest = uri.contains("TestRunner");
                
                System.out.println("FILTER: REQUEST URL: " + request.getRequestURI());
                System.out.println("isSessionActive: " + isSessionActive);
                System.out.println("isLoginPage: " + isLoginPage);
                System.out.println("isImage: " + isImage);
                System.out.println("isCSS: " + isCSS);
                System.out.println("isJS: " + isJS);
        
                if ((isSessionActive || isLoginPage || isImage || isCSS || isJS || isJSTest) && !isJSP) 
                {
        	       filter.doFilter(request, response);
                } 
                else
                {
        	       response.sendRedirect("login");
                }
	}
	
	public void destroy() 
        {
	}

}
