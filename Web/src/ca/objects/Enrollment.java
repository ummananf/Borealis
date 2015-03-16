package ca.objects;

import java.sql.Date;


public class Enrollment 
{
	private String courseID;
	private float grade;
	
	public Enrollment(int studentID, String crn, String sectID, String courseID, Date startDate, float grade) 
	{
		this.courseID = courseID;
		this.grade = grade;
	}
	
	public String getCourseID() 
	{
		return courseID;
	}
	
	public float getGrade() 
	{
		return grade;
	}

}
