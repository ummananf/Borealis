package ca.servlets;

//Import required java libraries
import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import ca.objects.*;
import ca.logic.LoginLogic;

//Extend HttpServlet class
@SuppressWarnings("serial")
public class LoginServlet extends HttpServlet {

	public static final String CURRENT_SESSION_USER = "CURRENT_SESSION_USER";

	/**
	 * doGet is logic that should be done before the page is rendered
	 */
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		System.out.println("**** MADE IT TO   __" + this.getServletName() + "__ ****");

		
		RequestDispatcher view = req.getRequestDispatcher("index.jsp");
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
			session.setAttribute(CURRENT_SESSION_USER, user);

			res.sendRedirect("main");
		}
		else {
			res.sendRedirect("invalidLogin.jsp");
		}

	}
}