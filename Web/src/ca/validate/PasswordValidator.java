package ca.validate;

public class PasswordValidator 
{
	public static boolean validate(String newPassword, String oldPassword)
	{
		boolean isValid = true;
		
		if(!newPassword.equals(oldPassword))
		{
			isValid = false;
		}
		else if (newPassword.length() > 16 || newPassword.length()<4)
		{
			isValid = false;
		}
		return isValid;
	}
}
