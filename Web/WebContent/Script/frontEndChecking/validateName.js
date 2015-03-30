function validateName(name)
{
	if(name=="")
	{
		return "empty";
	}
	else if(!isNaN(name))
	{
		return "Please Enter Only Characters";
	}
	else if ((name.length < 3) || (name.length > 15))
	{
		return "Your name must be 3 to 15 Characters";
	}
	else
	{
		return "success";
	}
}