package ca.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class MainServlet extends HttpServlet {



	/**
	 * doGet is logic that should be done before the page is rendered
	 */
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		// Check if user has a session, if not, don't allow access
		if (req.getSession().getAttribute(SessionGlobals.CURRENT_SESSION_USER) != null) {
			RequestDispatcher view = req.getRequestDispatcher("main.jsp");
			view.forward(req, res);
		} else {
			RequestDispatcher view = req
					.getRequestDispatcher("authRequired.jsp");
			view.forward(req, res);
		}

	}

	/**
	 * doPost is logic that should be done after a button is clicked
	 */
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		// post data and links

	}
}
