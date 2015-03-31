Then /^I should be at the Log In Screen$/ do
	check_element_exists "view:'ViewController' view:'UITextField' marked:'username'"
	check_element_exists "view:'ViewController' view:'UITextField' marked:'password'"
	check_element_exists "view:'ViewController' view:'UIButton' marked:'Log In'"
end

When /^I log in$/ do
	fill_in 'username', :with => 'bob'
	fill_in 'password', :with => '4350'
	touch "view:'UIButton' marked:'Log In'"
end

Then /^I should be at Home Screen$/ do
	check_element_exists "view:'MyInfoViewController' view:'UILabel' marked:'My Information'"
	check_element_exists "view:'MyInfoViewController' view:'UILabel' marked:'Username'"
	check_element_exists "view:'MyInfoViewController' view:'UILabel' marked:'Name'"
	check_element_exists "view:'MyInfoViewController' view:'UILabel' marked:'Student ID'"
	check_element_exists "view:'MyInfoViewController' view:'UILabel' marked:'E-mail'"
	check_element_exists "view:'MyInfoViewController' view:'UILabel' marked:'Degree'"
end

When /^I navigate to "My Courses"$/ do
	touch "view:'UIButton' marked:'My Courses'"
end

Then /^I should be at My Courses Screen$/ do
	check_element_exists "view:'MyCoursesViewController' view:'UILabel' marked:'Current Courses"
	check_element_exists "view:'MyCoursesViewController' view:'UITableView' marked:'myCourses'"
end

When /^I drop COMP1010$/ do
	touch "view:'MyCoursesViewController' view:'UITableVeiw' view:'TableVeiwCell' marked:'COMP1010' view:'UIButton' marked:'dropClicked'"
end

Then /^I should see an alert$/ do
	check_element_exists "view:'RegisterViewController' view:'UIAlertView' marked:'Successfully dropped!'"
end