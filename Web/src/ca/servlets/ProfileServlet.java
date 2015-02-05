package ca.servlets;

//Import required java libraries
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import ca.objects.*;
import ca.logic.Profile_BO;

//Extend HttpServlet class
public class ProfileServlet extends HttpServlet {

	private static final long serialVersionUID = 102831973239L;
	
	public static final String CURRENT_SESSION_USER = "CURRENT_SESSION_USER";
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
	         throws ServletException, IOException {
		
		try {
			
			System.out.println("***********MADE IT HERE************");
		    User user = new User( req.getParameter( "username" ), req.getParameter( "password" ));
		    Profile_BO aBO = new Profile_BO( user );
			System.out.println("u1=" + user.getUsername() + "___ " + user.getPassword());
		    if (aBO.isValid()) {
		          HttpSession session = req.getSession(true);	    
		          session.setAttribute(CURRENT_SESSION_USER, aBO.getUser() ); 
		          RequestDispatcher view = req.getRequestDispatcher("/main.jsp");
		          view.forward(req, res);
		          //res.sendRedirect("userLogged_throwaway.jsp"); //logged-in page      		
		     } else { 
		          //res.sendRedirect("invalidLogin_throwaway.jsp"); //error page 
		     }
		} catch (Throwable theException) {
		     System.out.println(theException); 
		}
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) 
              throws ServletException, IOException {
		//meh?
	}
	
	public void destroy() {
	   // do nothing.
	}
	
}