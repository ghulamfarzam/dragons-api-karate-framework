Feature: Get Account API

Background: API Setup Steps 
Given url "https://tek-insurance-api.azurewebsites.net" 

Scenario: Get an Account API call with existing account
	Given path "api/token"
	And request {"username": "supervisor","password": "tek_supervisor"}
	When method post
	Then status 200
	And print response
	#defination step is to define new variable in Karate Framework
	* def generatedToken = response.token
	Given path "/api/accounts/get/account"
	And param primaryPersonId = 4579
	And header Authorization = "Bearer " + generatedToken
	When method get
	Then status 200
	And print repsonse
	
	


