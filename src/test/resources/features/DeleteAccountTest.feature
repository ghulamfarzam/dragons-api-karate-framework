Feature: Delete Account

Background: API Test Setup
    #Callonce
    #the result of callonce can store into new variable using def step
    * def result = callonce read('GenerateToken.feature')
    And print result
    * def generatedToken = result.response.token
    Given url "https://tek-insurance-api.azurewebsites.net"
    
  Scenario: Delete Account Test
  Given path "/api/accounts/delete-account"
    And header Authorization = "Bearer " + generatedToken
    And param primaryPersonId = 6967
    When method delete
    Then status 200
    And print response
    
    