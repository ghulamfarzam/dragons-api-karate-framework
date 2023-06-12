Feature: get all plan

  Background: API Test Setup
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username": "supervisor", "password": "tek_supervisor"}
    When method post
    Then status 200
    And print response
    * def generatedToken = response.token

  Scenario: 
    Given path "/api/plans/get-all-plan-code"
    And header Authorization = "Bearer " + generatedToken
    When method get
    Then status 200
    And print response
