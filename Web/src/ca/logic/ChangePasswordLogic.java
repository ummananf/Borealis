package ca.logic;

import ca.persistence.UserModel;
import ca.validate.PasswordValidator;

public class ChangePasswordLogic
{
	private String newPasswordByUser;
	private String oldPasswordByUser;
	private int userID;
	private String oldPasswordInDB;
	
	public ChangePasswordLogic(String newPassword, String oldPassword, int userID)
	{		
		this.newPasswordByUser = newPassword;
		this.oldPasswordByUser = oldPassword;
		this.userID = userID;
	}
	
	public boolean changePassword()
	{
		boolean indicator = false;
		
		this.oldPasswordInDB = UserModel.getUserPasswordByID(userID);
		
		if(!PasswordValidator.validate(oldPasswordByUser, oldPasswordInDB))
		{
			System.out.println("db password error");
		}
		else
		{
			indicator = UserModel.updatePasswordByID(userID, newPasswordByUser);
		}
		return indicator;
	}
}
