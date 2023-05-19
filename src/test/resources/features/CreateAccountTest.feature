#Scenario 10;
#Endpoint = /api/accounts/add-primary-account
#status code = 201
#Assert email Address
#Note:
#duplicate email not accepted
#for gender and marital status you have to use the predefined values
#one you create account validate database and take screenshot
#

@Regression
Feature: Creating Account Test

  Background: API Test Setup
    #Callonce
    #the result of callonce can store into new variable using def step
    * def result = callonce read('GenerateToken.feature')
    And print result
    * def generatedToken = result.response.token
    Given url "https://tek-insurance-api.azurewebsites.net"

  Scenario: 
    Given path "/api/accounts/add-primary-account"
    And header Authorization = "Bearer " + generatedToken
    And request
      """
      {"email": "woodsides@gmail.com", 
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
    And assert response.email == "woodsides@gmail.com"
    
    
    #Delete created account (can delete the created account from the same feature)
    Given path "/api/accounts/delete-account"
    And header Authorization = "Bearer " + generatedToken
    And param primaryPersonId = response.id
    When method delete
    Then status 200
    And print response
    And assert response == "Account Successfully deleted"
    
    
