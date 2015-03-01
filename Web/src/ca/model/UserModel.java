package ca.model;

import ca.persistence.DB;

public class UserModel {

	public static Object[][] getUserData(String username) {
		String query = "SELECT * FROM Users WHERE username = '" + username
				+ "';";
		Object[][] data = null;
		String password = "";

		data = DB.executeQuery(query);
		//TODO: remove this later
		if (data != null) {
			password = data[0][2].toString();
			System.out.println("password retrieved: " + password);
		}

		return data;
	}
}
