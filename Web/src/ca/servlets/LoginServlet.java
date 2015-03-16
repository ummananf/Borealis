package ca.servlets;

//Import required java libraries
import java.io.*;
import java.util.ArrayList;

import javax.servlet.*;
import javax.servlet.http.*;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;

import ca.objects.*;
import ca.persistence.UserModel;
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
			
			
			/*************CREATE JSON*******************/
			ArrayList<User> users = new ArrayList<User>();
			Gson gsonUser = new Gson();
			users.add(user);
			JsonElement element = gsonUser.toJsonTree(users, new TypeToken<ArrayList<User>>() {}.getType());
			JsonArray userInfo = element.getAsJsonArray();
			System.out.println("dlkjfdlkjaf;lkdjs;lfkajsd"+userInfo.toString());
			req.setAttribute("userInfo", userInfo);
			res.setContentType("application/json");	
			res.getWriter().print(userInfo);	
			session.setAttribute("userInfo", userInfo);		
			
			/************END OF CREATING**************/
			
			res.setStatus(HttpServletResponse.SC_OK);

		}
		else {
			res.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Incorrect user name or password.");
		}

	}
}