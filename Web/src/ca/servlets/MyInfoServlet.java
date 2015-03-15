package ca.servlets;

import java.io.IOException;
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

import ca.objects.Student;

//Extend HttpServlet class
@SuppressWarnings("serial")
public class MyInfoServlet extends HttpServlet {


	/**
	 * doGet is logic that should be done before the page is rendered
	 */
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		System.out.println("**** MADE IT TO   __" + this.getServletName() + "__ ****");
		
		HttpSession session = req.getSession(true);
		
		// create a list of students
		ArrayList<Student> students = new ArrayList<Student>();
		
		// create a dummy student for testing purposes
		Student student = new Student(7777777,  "donKnow","adfb", "kkk@gmail.com",
				   "don", "Know");
		students.add(student);
		
		Gson gsonStudent = new Gson();
		
		JsonElement element = gsonStudent.toJsonTree(students, new TypeToken<ArrayList<Student>>() {}.getType());
		
		JsonArray myInfo = element.getAsJsonArray();
		
		req.setAttribute("studentInfo", myInfo);

		res.setContentType("application/json");
		res.getWriter().print(myInfo);
		
		session.setAttribute("studentInfo", myInfo);
		
		
		RequestDispatcher view = req.getRequestDispatcher("myInfo.jsp");
		view.forward(req, res);

	}

	/**
	 * doPost is logic that should be done after a button is clicked
	 */
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		//manipulate data on submit here

	}
}
