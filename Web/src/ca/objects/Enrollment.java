package ca.objects;

import java.sql.Date;


public class Enrollment {

	private int userID;
	private String sectID, courseID;
	private Date termStart; 
	private float grade;
	
	public Enrollment(int studentID, String sectID, String courseID, Date startDate, float grade) {
		userID = studentID;
		this.sectID = sectID;
		this.courseID = courseID;
		termStart = startDate;
		this.grade = grade;
	}
	
	// TODO: write more getters
	public String getCourseID() {
		return courseID;
	}
	public float getGrade() {
		return grade;
	}

}
