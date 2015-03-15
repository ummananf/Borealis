package ca.persistence;

public class EnrollmentModel {
	private static String GET_ALL_ENROLLMENT_COURSES =
			"SELECT * "
			+ "FROM courses "
			+ "NATURAL JOIN sections";		
}
