package ca.objects;

import ca.persistence.UserModel;


public class Student extends User 
{		
	private String degName;
	private int maxCreditsPerTerm;
	
	public Student(int userID, String username, String password, String email,
				   String fName, String lName, String degName, int maxCreditsPerTerm) 
	{
		super(userID, username, password, email, fName, lName, UserModel.TYPE_STUDENT);
		this.degName = degName;
		this.maxCreditsPerTerm = maxCreditsPerTerm;
	}

	public String getDegName() 
	{
		return degName;
	}
	public void setDegName(String degName) 
	{
		this.degName = degName;
	}
	
	public int getMaxCreditsPerTerm()
	{
		return maxCreditsPerTerm;
	}
}
