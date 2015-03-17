
describe("Test Front end login logic", function()
{
	
	beforeEach(function(){
		// TODO use sandbox()
	    form = $('<form action="login" id="login_form" method="post" name="login" onSubmit=""> <input id="username" value="" name="username" type="text"/></form> ');
	    $(document.body).append(form);
	  });
   
  it('should not allow user to enter non English or non number chacter as the user name', function() {
	  //view.render();
	  //var form = $('#login_form');
	  //var submitCallback = jasmine.createSpy().andReturn(false);
	  //form.submit(submitCallback);
	  
	  //form.elements['username'].value = 'bob';
	  $('#username').val("bob");

	  //$('#submit_btn').click();
	  //validateForm(submitCallback);

	 // expect(helloWorld()).toEqual("Hello dworld!");
	 expect(form.attr('action')).toEqual('login');
	 expect($('#username').val()).toEqual('bob');
	  //expect($('#username').attr('value')).toEqual('1');// TODO
	  //expect(submitCallback).toHaveBeenCalled();
	});
});




