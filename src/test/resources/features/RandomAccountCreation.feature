@Resgression

Feature: 

Background: setup Test Generate Token

* def tokenFeature = callonce read('GenerateToken.feature')
* def token = tokenFeature.response.token
Given url "https://tek-insurance-api.azurewebsites.net"

Scenario: Create Account with Ransom Email
#Call java Class and method with Karate

* def dataGenerator = Java.type('api.data.GenerateData')
* def autoEmail = dataGenerator.getEmail()
Given path "/api/accounts/add-primary-account"
And header Authorization = "Bearer " + token
And request
"""
{
			"email": "#(autoEmail)", 
      "firstName": "Ghulam", 
      "lastName": "Farzam", 
      "title": "Mr",  
      "gender": "MALE", 
      "maritalStatus": "MARRIED", 
      "employmentStatus": "jobless", 
      "dateOfBirth": "1900-05-10T23:43:53.821Z"
      }
      """
    When method post
    Then status 201
    And print response
    And assert response.email == autoEmail