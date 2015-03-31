package ca.logic;

import java.sql.Date;
import java.util.ArrayList;

import ca.objects.Course;
import ca.objects.Enrollment;
import ca.objects.Prereq;
import ca.objects.RegistrationResponse;
import ca.objects.Section;
import ca.objects.Student;
import ca.objects.User;
import ca.objects.Term;
import ca.persistence.CourseModel;
import ca.persistence.SectionModel;
import ca.persistence.StudentModel;
import ca.persistence.UserModel;


public class RegistrationLogic 
{

	public RegistrationLogic() {}
	
	
	// Should check that studentID is in fact valid studentID prior to this
	public boolean meetsPrereqs(int studentID, String courseID)
	{
		ArrayList<Enrollment> completedEnrollments = StudentModel.getCompletedEnrollments(studentID);
		ArrayList<Prereq> prereqs = CourseModel.getPrereqs(courseID);
		boolean allPrereqsMet = true; //start as true, so if no prereq, still true
		
		for(int i = 0; i < prereqs.size() && allPrereqsMet; i++)
		{
			Prereq p = prereqs.get(i);
			boolean currPrereqMet = false;
			
			for(Enrollment enrol : completedEnrollments)
			{
				if(p.getRequiredCourseID().equals(enrol.getSection().getCourseID()))
					if(enrol.getGrade() >= p.getMinGrade())
						currPrereqMet = true;
			}
			
			allPrereqsMet = currPrereqMet;
		}
		
		return allPrereqsMet;
	}
	
	
	// Check if user allowed to register for the given section (given by crn)
	public RegistrationResponse canRegister(int userID, String crn)
	{
		boolean success = false;
		String resMsg = "";
		User user = UserModel.getUserByID(userID);
		Section sect = SectionModel.getSectionByCRN(crn);
		Course course = CourseModel.getCourseByID(sect.getCourseID());
		
		Student student = (Student)user;
		String sectTermID = sect.getTermStart();
		Term currTerm = TermLogic.getTerm(new Date(System.currentTimeMillis()));
		ArrayList<Enrollment> currEnrollments = StudentModel.getEnrollmentsByTerm(userID, sectTermID);
		
		if( !(user.getType().equals("student") ) )
		{
			resMsg = "Only students may register for courses.";
		}
		else if(StudentModel.getNumCreditHrsRegistered(userID, sectTermID) + course.getCreditHrs() > student.getMaxCreditsPerTerm())
		{
			resMsg = "Reached maximum credit hour limit of " + student.getMaxCreditsPerTerm() + " for this term.";
		}
		else if(!meetsPrereqs(userID, course.getCourseID()) )
		{
			resMsg = "Prerequisites not met for this course.";
		}
		else if(!sectTermID.equals(currTerm.getTermID()) )
		{
			resMsg = "Registration for this term is not active.";
		}
		else
		{
			// Check if user already registered for this course (in any of its sections too)
			boolean alreadyReged = false;
			
			for(int i = 0; i < currEnrollments.size() && !alreadyReged; i++)
			{
				if(currEnrollments.get(i).getSection().getCourseID().equals(sect.getCourseID()))
					alreadyReged = true;
			}
			
			if(alreadyReged)
				resMsg = "Already registered for this course in this term!";
			else
				success = true;
		}
		
		System.out.println("hours reg'd: " + StudentModel.getNumCreditHrsRegistered(userID, sectTermID));
		System.out.println("course creds: " + course.getCreditHrs());
		System.out.println("students max: " + student.getMaxCreditsPerTerm());
		
		return new RegistrationResponse(success, resMsg);
	}
	
}
