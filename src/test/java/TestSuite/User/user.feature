Feature: User Module

  Scenario: Creates list of users with given input array
    *def reqBody = [{"id": 0,"username": "string","firstName": "string","lastName": "string","email": "string","password": "string","phone": "string","userStatus": 0}]
    When url "https://petstore.swagger.io/v2/user/createWithArray"
    When method post
    And request reqBody
    Then print response
    And status 200

  Scenario: Creates list of users with given input array
  *def reqBody = [{"id": 0,"username": "string","firstName": "string","lastName": "string","email": "string","password": "string","phone": "string","userStatus": 0}]
    When url "https://petstore.swagger.io/v2/user/createWithList"
    When method post
    And request reqBody
    Then print response
    And status 200

  Scenario: Get user by username
    When url "https://petstore.swagger.io/v2/user/string"
    When method get
    Then print response
    And status 200

  Scenario: Updated user
  *def reqBody = {"id": 0,"username": "string","firstName": "string","lastName": "string","email": "string","password": "string","phone": "string","userStatus": 0}
    When url "https://petstore.swagger.io/v2/user/string"
    When method put
    And request reqBody
    Then print response
    And status 200

  Scenario: delete user
    When url "https://petstore.swagger.io/v2/user/string"
    When method delete
    Then print response
    And status 200

  Scenario: Logs user into the system
    When url "https://petstore.swagger.io/v2/user/login?username=string&password=string"
    When method get
    Then print response
    And status 200

  Scenario: Logs out current logged in user session
    When url "https://petstore.swagger.io/v2/user/logout"
    When method get
    Then print response
    And status 200

  Scenario: create user
  *def reqBody = {"id": 0,"username": "string","firstName": "string","lastName": "string","email": "string","password": "string","phone": "string","userStatus": 0}
    When url "https://petstore.swagger.io/v2/user"
    When method post
    And request reqBody
    Then print response
    And status 200



