package ca.objects;

import java.sql.Date;


public class Enrollment {

	private int userID;
	private String crn;
	private String sectID, courseID;
	private Date termStart; 
	private float grade;
	
	public Enrollment(int studentID, String crn, String sectID, String courseID, Date startDate, float grade) {
		userID = studentID;
		this.crn = crn;
		this.sectID = sectID;
		this.courseID = courseID;
		termStart = startDate;
		this.grade = grade;
	}
	
	public String getCourseID() {
		return courseID;
	}
	public float getGrade() {
		return grade;
	}

}
