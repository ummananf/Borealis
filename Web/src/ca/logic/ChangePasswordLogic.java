package ca.logic;

import ca.persistence.UserModel;
import ca.validate.PasswordValidator;

public class ChangePasswordLogic
{
	private String newPasswordByUser;
	private int userID;
	private String oldPasswordInDB;
	
	public ChangePasswordLogic(String newPassword, String oldPassword, int userID)
	{		
		this.newPasswordByUser = newPassword;
		this.userID = userID;
	}
	
	public boolean changePassword()
	{
		boolean indicator = false;
		
		this.oldPasswordInDB = UserModel.getUserPasswordByID(userID);
		
		if(PasswordValidator.validate(newPasswordByUser, oldPasswordInDB))
		{
			indicator = UserModel.updatePasswordByID(userID, newPasswordByUser);
		}
		else
		{
			System.out.println("db password error");
		}
		return indicator;
	}
}
