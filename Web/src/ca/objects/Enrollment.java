package ca.objects;

public class Enrollment {

	private String courseID;
	private float grade;
	//TODO: add more to match enrolled table
	
	public Enrollment(String courseID, float grade) {
		this.courseID = courseID;
		this.grade = grade;
	}
	
	public String getCourseID() {
		return courseID;
	}
	public float getGrade() {
		return grade;
	}

}
