function validateEmail(email) 
{
    var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
    
    if(email == "")
    {
    	return "empty"; // user chose not to enter email
    }
    else if( regex.test(email))
    {
    	return "success";
    }
    else
    {
    	return "the format of your e-mail is not correct";
    }
}