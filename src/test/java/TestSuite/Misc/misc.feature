Feature: Test Misc Plan

  Background:
    * url 'https://api.spoonacular.com/food/'
    * def apiKey = '8e7179e04ad6478da37fa814579c9072'
    * def username = 'borsak123'
    * def hash = 'cc6683875fe4e5015a5fae74e024b395fba9d50b'

  Scenario: Random Food Joke
    Given path 'jokes/random'
    And param apiKey = apiKey
    When method get
    Then status 200
    And print 'response: ', response

  Scenario: Detect food in text
    Given path 'detect'
    And header Content-Type = 'application/x-www-form-urlencoded'
    And param apiKey = apiKey
    And param text = 'Irvan like to eat meatballs everyday'
    When method post
    Then status 200
    And print 'response: ', response

  Scenario: Image analysis by url
    Given path 'images/analyze'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And param imageUrl = 'https://png.pngtree.com/png-clipart/20220404/ourmid/pngtree-sweet-fried-banana-indonesian-dessert-snack-for-iftar-ramadan-png-image_4526310.png'
    When method get
    Then status 200
    And print 'response: ', response