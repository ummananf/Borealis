package ca.objects;


public class User {

	private int userID;
	private String username, password, email, firstName, lastName, type;

	public User(int userID, String username, String password, String email,
			String fName, String lName, String type) {
		this.userID = userID;
		this.username = username;
		this.password = password;
		this.email = email;
		firstName = fName;
		lastName = lName;
		this.type = type;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUsername() {
		return username;
	}

	public String getPassword() {
		return password;
	}

	public String toString() {
		return "ID: " + userID + "\nUsername: " + username + "\nPassword: "
				+ password + "\nFirst Name: " + this.firstName
				+ "\nLast Name: " + this.lastName + "\nEmail: " + this.email
				+ "\nUser Type: " + type;
	}
}
