# End 2 End Account Testing
# Create Account
# Add address
# add phone
# Add car
# Get Account
# Note: Everything in 1 scenario
Feature: End-to-End Account Testing

  Background: API Test Setup
    * def result = callonce read('GenerateToken.feature')
    And print result
    * def generatedToken = result.response.token
    Given url "https://tek-insurance-api.azurewebsites.net"

  Scenario: End-to-End Account Creation Testing
    * def dataGenerator = Java.type('api.data.GenerateData')
    # java.type is to call java class.
    * def emailAddressData = dataGenerator.getEmail()
    Given path "/api/accounts/add-primary-account"
    And header Authorization = "Bearer " + generatedToken
    And request
      """
      {
      			"email": "#(emailAddressData)", 
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
    And assert response.email == emailAddressData
    And assert response.firstName == "Ghulam"
    * def generatedAccountId = response.id
    # add address:
    Given path "/api/accounts/add-account-address"
    And param primaryPersonId = generatedAccountId
    And header Authorization = "Bearer " + generatedToken
    And request
      """
      {
      "addressType": "Co-op",
      "addressLine1": "630 1st Avenue",
      "city": "New York",
      "state": "New York",
      "postalCode": "10017",
      "countryCode": "string",
      "current": true
      }
      """
    When method post
    Then status 201
    And print response
    And assert response.addressLine1 == 630 1st Avenue
    # add phone
    Given path "/api/accounts/add-account-phone"
    And param primaryPersonId = generatedAccountId
    And header Authorization = "Bearer " + generatedToken
    And request
      """
      {
      "id": 0,
      "phoneNumber": "string",
      "phoneExtension": "string",
      "phoneTime": "string",
      "phoneType": "string"
      }
      """
