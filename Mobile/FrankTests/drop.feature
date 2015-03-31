Feature: Drop a course

Scenario: Dropping a courses
Given I launch the app
Then I should be at the Log In Screen

When I log in
Then I should be at Home Screen

When I navigate to "My Courses"
Then I should be at My Courses Screen

When I drop COMP1010
Then I should see an alert