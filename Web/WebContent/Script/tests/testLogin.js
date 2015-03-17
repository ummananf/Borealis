
describe("Test Front end login logic", function()
{
	// Specify where to find jsp files
	jasmine.getFixtures().fixturesPath = '../../Script/tests/fixtures';

	
//	beforeEach(function(){
//		// TODO use sandbox()
//	    form = $('<form action="login" id="login_form" method="post" name="login" onSubmit=""> <input id="username" value="" name="username" type="text"/></form> ');
//	    $(document.body).append(form);
//	  });
   
  it('should not allow user to enter non English or non number chacter as the user name', function() {
	  //view.render();
	  //var form = $('login_form');
	  //var submitCallback = jasmine.createSpy().andReturn(false);
	  //form.submit(submitCallback);
	  //var input = $('<input value=someVal>');
	  loadFixtures('indexFixt.jsp'); //the one with login form
	  expect( $('#login_form')).toExist();
	  
	  
	  //form.elements['username'].value = 'bob';
	  //$('#username').val("bob");

	  //$('#submit_btn').click();
	  //validateForm(submitCallback);

	 // expect(helloWorld()).toEqual("Hello dworld!");
	 //expect(form.attr('name')).toEqual('login');
	 //expect(input.val()).toEqual('someVal');
	 //expect(input).toHaveValue('someVal');// .toEqual('someVal');
	  //expect($('#username').attr('value')).toEqual('1');// TODO
	  //expect(submitCallback).toHaveBeenCalled();
	 
	});
});




