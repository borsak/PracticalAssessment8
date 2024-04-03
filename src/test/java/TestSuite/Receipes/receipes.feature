Feature: Test receipes

  Background:
    * url 'https://api.spoonacular.com'
    * def apiKey = '8e7179e04ad6478da37fa814579c9072'
    * def username = 'borsak123'
    * def hash = 'cc6683875fe4e5015a5fae74e024b395fba9d50b'
    * def header =
    """
    {
    "Content-Type": "application/json"
    }
    """

  Scenario: Search Recipes
    Given path 'recipes/complexSearch'
    And param apiKey = apiKey
    And request header
    When method get
    * print response
    Then status 200

  Scenario: Get Recipe Information
    Given path '/recipes/716429/information'
    And param includeNutrition = false
    And param apiKey = apiKey
    And request header
    When method get
    * print response
    Then status 200

  Scenario: Get Recipe Information Bulk
    Given path '/recipes/informationBulk'
    And param ids = 715538,716429
    And param includeNutrition = false
    And param apiKey = apiKey
    And request header
    When method get
    * print response
    Then status 200

  Scenario: Get Similar Recipes
    Given path '/recipes/715538/similar'
    And param apiKey = apiKey
    And request header
    When method get
    * print response
    Then status 200

  Scenario: Get Random Recipes
    Given path '/recipes/random'
    And param number = 1
    And param include-tags = 'vegetarian, dessert'
    And param exclude-tags = 'dairyFree'
    And param apiKey = apiKey
    And request header
    When method get
    * print response
    Then status 200

  Scenario: Analyze Recipe
    * def body =
    """
    {
    "title": "Spaghetti Carbonara",
    "servings": 2,
    "ingredients": [
        "1 lb spaghetti",
        "3.5 oz pancetta",
        "2 Tbsps olive oil",
        "1  egg",
        "0.5 cup parmesan cheese"
    ],
    "instructions": "Bring a large pot of water to a boil and season generously with salt. Add the pasta to the water once boiling and cook until al dente. Reserve 2 cups of cooking water and drain the pasta. "
}
    """
    Given path '/recipes/analyze'
    And param apiKey = apiKey
    And param language = 'en'
    And param includeNutrition = false
    And param includeTaste = false
    And request header
    And request body
    When method post
    * print response
    Then status 200

  Scenario: Summarize Recipe
    Given path '/recipes/4632/summary'
    And param apiKey = apiKey
    And request header
    When method get
    * print response
    Then status 200

  Scenario: Classify Cuisine
    * def body =
    """
    {
    "cuisine": "Mediterranean",
    "cuisines": [
        "Mediterranean",
        "European",
        "Italian"
    ],
    "confidence": 0.0
    }
    """
    Given path '/recipes/cuisine'
    And param apiKey = apiKey
    And request header
    And request body
    When method post
    * print response
    Then status 200

  Scenario: Analyze a Recipe Search Query
    Given path '/recipes/queries/analyze'
    And param apiKey = apiKey
    And param q = 'salmon with fusilli and no nuts'
    And request header
    When method get
    * print response
    Then status 200
