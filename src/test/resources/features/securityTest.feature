Feature: API Test Security Section

Background:
Given url "https://tek-insurance-api.azurewebsites.net" 
And path "/api/token"

@Test
Scenario: Create token with valid username and password. 
#prepare request 
And request {"username": "supervisor","password": "tek_supervisor"} 
#Send request 
When method post 
#Validating response 
Then status 200 
And print response


@Test1
Scenario: Validate Token with Invalid username
And request {"username": "supervidor","password": "tek_supervisor"} 
When method post 
#Validating response 
Then status 400 
And print response
And assert response.errorMessage == "User not found"


@Test2
Scenario: Validate Token with Valid username and Invalid Password
And request {"username": "supervisor","password": "ted_supervisor"} 
When method post
Then status 400 
And print respone
And assert response.errorMessage == "Password Not Matched" 
And assert response.httpStatus == "BAD_REQUEST"



