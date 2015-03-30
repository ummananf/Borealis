package ca.logic;

import ca.persistence.UserModel;
import ca.validate.EmailValidator;

public class ChangeEmailLogic 
{
	private int userID;
	private String newEmail;
	
	public ChangeEmailLogic(String newEmail,int userID)
	{
		this.newEmail = newEmail;
		this.userID = userID;
	}
	
	public boolean changeEmail()
	{
		boolean indicator = false;
		if(EmailValidator.validate(this.newEmail))
		{
			if(UserModel.updateUserEmail(this.userID, this.newEmail))
			{
				indicator = true;
			}
		}
		return indicator;
	}
}
