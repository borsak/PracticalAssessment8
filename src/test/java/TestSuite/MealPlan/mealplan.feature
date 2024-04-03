Feature: Test meal plan

  Background:
    * url 'https://api.spoonacular.com/mealplanner'
    * def apiKey = '8e7179e04ad6478da37fa814579c9072'
    * def username = "borsak123"
    * def hash = 'cc6683875fe4e5015a5fae74e024b395fba9d50b'
    * def starDate = '2024-03-27'

  Scenario: test generate meal plan
    Given path 'generate'
    And param apiKey = apiKey
    When method get
    Then status 200
    And print 'Response :', response

  Scenario: test add to meal plan
    Given path username, 'items'
    And param apiKey = apiKey
    And header Content-Type = 'application/json'
    And param hash = hash
    And request
    """
    {
    "date": 1589500800,
    "slot": 1,
    "position": 0,
    "type": "INGREDIENTS",
    "value": {
        "ingredients": [
            {
                "name": "1 banana"
            }
        ]
      }
    }
    """
    When method post
    Then status 200
    And match response.status == 'success'

    Scenario: Test Meal Plan by Week
      Given path username,'week',starDate
      And param apiKey = apiKey
      And param hash = hash
      When method get
      Then status 200
      And print 'Response:', response

  Scenario: Delete from Meal Plan
    Given path username,'items','25627584'
    And param apiKey = apiKey
    And param hash = hash
    When method delete
    Then status 200
    And match response.status == 'success'