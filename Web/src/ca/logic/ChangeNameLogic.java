package ca.logic;

import ca.persistence.UserModel;
import ca.validate.UsernameValidator;

public class ChangeNameLogic 
{
	private int userID;
	private String newUserName;
	
	public ChangeNameLogic(int userID, String newUserName)
	{
		this.userID = userID;
		this.newUserName = newUserName;
	}
	
	public boolean changeName()
	{
		boolean validator = false;
		
		if(UsernameValidator.validate(this.newUserName))
		{
			if(UserModel.updateUserName(this.userID, this.newUserName))
			{
				validator = true;
			}
		}
		return validator;
	}
}
