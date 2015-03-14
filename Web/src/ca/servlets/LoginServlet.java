package ca.servlets;

//Import required java libraries
import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import ca.objects.*;
import ca.session.SessionGlobals;
import ca.logic.LoginLogic;

//Extend HttpServlet class
@SuppressWarnings("serial")
public class LoginServlet extends HttpServlet {
	
	// need this to keep url as "login" so the filter works properly as it checks for "login" page
	// and not "index.jsp"

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		RequestDispatcher view = req.getRequestDispatcher("pages/index.jsp");
		view.forward(req, res);
	}

	/**
	 * doPost is logic that should be done after a button is clicked
	 */
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		LoginLogic loginService = new LoginLogic();
		User user = loginService.getUserIfValid(req.getParameter("username"), req.getParameter("password"));

		if (user != null) {
			HttpSession session = req.getSession(true);
			session.setAttribute(SessionGlobals.CURRENT_SESSION_USER, user);
			res.setStatus(HttpServletResponse.SC_OK);

		}
		else {
			res.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Incorrect user name or password.");
		}

	}
}