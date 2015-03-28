package ca.servlets;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.Registration;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import ca.logic.RegistrationLogic;
import ca.objects.RegistrationResponse;
import ca.objects.User;
import ca.persistence.EnrollmentModel;

@SuppressWarnings("serial")
public class RegisterDropCourseServlet extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		HttpSession session = req.getSession();
		User user = (User) session
				.getAttribute(SessionGlobals.CURRENT_SESSION_USER);
		String userId = String.valueOf(user.getUserID());
		String action = req.getParameter("action");
		String crn = req.getParameter("crn");

		System.out.println("RegisterDropCourseServlet: " + userId + " " + action + " " + crn);

		boolean actionSuccessful = true;
		RegistrationLogic regLogic = new RegistrationLogic();
		RegistrationResponse regResponse = null;
		
		if (action.equals("register")) 
		{	
			// Check if user is allowed to register for this course
			regResponse = regLogic.canRegister(Integer.parseInt(userId), crn);
			
			if(regResponse.isSuccess())
				actionSuccessful = EnrollmentModel.addNewEnrollment(userId, crn);  //actually do the register
		} 
		else if (action.equals("drop")) 
		{
			actionSuccessful = EnrollmentModel.deleteEnrollment(userId, crn);
		}
		

		if (actionSuccessful) {
			
			// Send JSON data if action was register
			if(action.equals("register")) {

				String regResponseJSON = new Gson().toJson(regResponse);

				res.setContentType("application/json");
				res.getWriter().print(regResponseJSON);
			}
						
			res.setStatus(HttpServletResponse.SC_OK);
	
		} else {
			res.sendError(HttpServletResponse.SC_BAD_REQUEST,
					"Action unsuccessful.");
		}
	}
}
