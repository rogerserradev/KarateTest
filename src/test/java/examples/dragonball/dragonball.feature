Feature: sample karate test script
  for help, see: https://github.com/karatelabs/karate/wiki/IDE-Support

  Background:
    * url 'https://dragonball-api.com/api/'

  Scenario: get all characters and then get the first character by id
    Given path 'characters'
    When method get
    Then status 200

    * def first = response.items[0]

    Given path 'characters', first.id
    When method get
    Then status 200
