@Smoke

Feature: get all plan

  Background: API Test Setup
    * def result = callonce read('GenerateToken.feature')
    And print result
    * def generatedToken = result.response.token
    Given url "https://tek-insurance-api.azurewebsites.net"


  Scenario: get all plan code API
    Given path "/api/plans/get-all-plan-code"
    And header Authorization = "Bearer " + generatedToken
    When method get
    Then status 200
    And print response
