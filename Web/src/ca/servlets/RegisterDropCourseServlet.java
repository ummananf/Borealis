package ca.servlets;

import java.io.IOException;

import javax.servlet.Registration;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ca.logic.RegistrationLogic;
import ca.objects.RegisterResponse;
import ca.objects.User;
import ca.persistence.DB;
import ca.persistence.EnrollmentModel;
import ca.persistence.StudentModel;

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

		String query;
		boolean actionSuccessful = false;
		RegistrationLogic regLogic = new RegistrationLogic();
		
		if (action.equals("register")) 
		{
			// Check if user is allowed to register for this course
			RegisterResponse regResponse = regLogic.canRegister(Integer.parseInt(userId), crn);
			
			
			if(regResponse == RegisterResponse.SUCCESS)
				actionSuccessful = EnrollmentModel.addNewEnrollment(userId, crn);  //actually do the register
			else
			{
				// TODO: send error msg as json to client
				System.out.println(regLogic.getRegistrationErrorMessage(regResponse));
			}
		} 
		else if (action.equals("drop")) 
		{
			actionSuccessful = EnrollmentModel.deleteEnrollment(userId, crn);
		}

		if (actionSuccessful) {
			res.setStatus(HttpServletResponse.SC_OK);
		} else {
			res.sendError(HttpServletResponse.SC_BAD_REQUEST,
					"Action unsuccessful.");
		}
	}
}
