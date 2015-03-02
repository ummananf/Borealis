package ca.objects;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

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
	public Enrollment(ResultSet data) {
		try {
			userID = data.getInt("userID");
			sectID = data.getString("sectID");
			courseID = data.getString("cID");
			termStart = data.getDate("termStart");
			grade = data.getFloat("grade");
		} catch (SQLException e) {
			System.out.println("error creating new Enrollment from DB data");
			e.printStackTrace();
		}
	}
	
	// TODO: write more getters
	public String getCourseID() {
		return courseID;
	}
	public float getGrade() {
		return grade;
	}

}
