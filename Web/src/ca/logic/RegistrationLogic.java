package ca.logic;

import java.util.ArrayList;

import ca.objects.Enrollment;
import ca.objects.Prereq;
import ca.persistence.CourseModel;
import ca.persistence.StudentModel;


public class RegistrationLogic 
{

	public RegistrationLogic() {}
	
	
	// Should check that studentID is in fact valid studentID prior to this
	public boolean meetsPrereqs(int studentID, String courseID)
	{
		ArrayList<Enrollment> completedCourses = StudentModel.getCompletedCourses(studentID);
		ArrayList<Prereq> prereqs = CourseModel.getPrereqs(courseID);
		boolean allPrereqsMet = true; //start as true, so if no prereq, still true
		
		for(int i = 0; i < prereqs.size() && allPrereqsMet; i++)
		{
			Prereq p = prereqs.get(i);
			boolean currPrereqMet = false;
			
			for(Enrollment e : completedCourses)
			{
				if(p.getRequiredCourseID().equals(e.getCourseID()))
					if(e.getGrade() >= p.getMinGrade())
						currPrereqMet = true;
			}
			
			allPrereqsMet = currPrereqMet;
		}
		
		return allPrereqsMet;
	}
}
