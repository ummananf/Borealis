
describe("Login logic", function()
{
	beforeEach(function() {
		// Specify where to find jsp files
		jasmine.getFixtures().fixturesPath = '../../Script/tests/fixtures';
		loadFixtures('indexFixt.jsp'); //the one with login form
		
		// Spy on this so the actual method doesn't get executed
		show_err_msg = jasmine.createSpy("showErrSpy");
	});

	it('Checks that blank fields fail validation', function() {
		expect( $('#login_form')).toExist();

		  // Set invalid entry data on the form
		  $('#username').val("bob");
		  $('#password').val("");
		  
		  expect(validateForm()).toEqual(false);
		  expect(show_err_msg).toHaveBeenCalled();
		  
		  $('#username').val("");
		  $('#password').val("");
		  expect(validateForm()).toEqual(false);
		  expect(show_err_msg).toHaveBeenCalled();
		  
		  $('#username').val("");
		  $('#password').val("1234");
		  expect(validateForm()).toEqual(false);
		  expect(show_err_msg).toHaveBeenCalled();
		  
	});
  
	it('Checks that invalid characters in username fail form validation', function() {
		  // Set invalid entry data on the form
		  $('#username').val("bob 1"); //no spaces allowed
		  $('#password').val("4350");
		  
		  expect(validateForm()).toEqual(false);
		  expect(show_err_msg).toHaveBeenCalled();
		  
		  $('#username').val("b.o.b");  //no punctuation marks allowed
		  $('#password').val("4350");
		  expect(validateForm()).toEqual(false);
		  expect(show_err_msg).toHaveBeenCalled();
	});
  
	it('Checks that valid characters will pass form validation', function() {
		  // Set valid entry data on the form
		  $('#username').val("bob");
		  $('#password').val("4350");
		  
		  expect(validateForm()).toEqual(true);
		  expect(show_err_msg).not.toHaveBeenCalled();
		  
		  $('#username').val("bob");
		  $('#password').val("wrongpass");
		  expect(validateForm()).toEqual(true);
		  expect(show_err_msg).not.toHaveBeenCalled();
	});
});




