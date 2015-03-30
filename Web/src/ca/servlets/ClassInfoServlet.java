package ca.servlets;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;

import ca.logic.TermLogic;
import ca.objects.Enrollment;
import ca.objects.Term;
import ca.objects.User;
import ca.persistence.EnrollmentModel;
import ca.persistence.StudentModel;
import ca.persistence.TermModel;
import ca.session.SessionGlobals;


public class ClassInfoServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		System.out.println("**** MADE IT TO   __" + this.getServletName() + "__ ****");
		
		// This method activates the session
		HttpSession session = req.getSession(true);
		
		
		// Create an ArrayList to hold Enrollment Records
		ArrayList<Enrollment> enrollments = new ArrayList<Enrollment>();
		
		// before we call the model to get enrollment records from the db, we need to know the userID
		User student = (User)session.getAttribute(SessionGlobals.CURRENT_SESSION_USER);
		int userID = student.getUserID();
		
		
		// Get current term by current date, then get all of this user's enrollments for that term
		Term currTerm = TermLogic.getTerm(new Date(System.currentTimeMillis()));
		enrollments = StudentModel.getEnrollmentsByTerm(userID, currTerm.getTermID());
		//enrollments = EnrollmentModel.getDetailedEnrollmentRecords(userID);
		//enrollments = EnrollmentModel.getEnrollmentRecord(userID);
		
		// setup gson for coverting object to json object
		Gson gsonEnrollment = new Gson();
		
		
		// start to converting object to json....
		JsonElement element = gsonEnrollment.toJsonTree(enrollments, new TypeToken<ArrayList<Enrollment>>() {}.getType());
		
		// final conversion
		JsonArray enrollmentInfo = element.getAsJsonArray();
		
		req.setAttribute("enrollmentInfo", enrollmentInfo);
		
		// Tell servlet that we are sending JSON
		res.setContentType("application/json");
		
		res.getWriter().print(enrollmentInfo);
		
		session.setAttribute("enrollmentInfo", enrollmentInfo);
				
		RequestDispatcher view = req.getRequestDispatcher("classInfo.jsp");	
		view.forward(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException 
	{
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute(SessionGlobals.CURRENT_SESSION_USER);
		int userID = user.getUserID();
		
		System.out.println("class info userid " + userID);
		
		// Create an ArrayList to hold Enrollment Records
		ArrayList<Enrollment> enrollments = new ArrayList<Enrollment>();

		
		// Get current term by current date, then get all of this user's enrollments for that term
		Term currTerm = TermLogic.getTerm(new Date(System.currentTimeMillis()));
		enrollments = StudentModel.getEnrollmentsByTerm(userID, currTerm.getTermID());
		
		// start to converting object to json....
		JsonElement element = new Gson().toJsonTree(enrollments, new TypeToken<ArrayList<Enrollment>>() {}.getType());
		
		// final conversion
		JsonArray enrollmentInfo = element.getAsJsonArray();
		
		//req.setAttribute("enrollmentInfo", enrollmentInfo);
		
		// Tell servlet that we are sending JSON
		res.setContentType("application/json");
		
		res.getWriter().print(enrollmentInfo);
		
		
	}
}
