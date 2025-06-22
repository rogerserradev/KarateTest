Feature: sample karate testing for dragon ball

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

  Scenario: get all saiyans from dragon ball
    Given path 'characters'
    When method get
    Then status 200

    * def saiyans = response.items.filter(x => x.race == 'Saiyan')
    * karate.forEach(saiyans, x => karate.log('Saiyan:', x.name))

  Scenario: get all humans from dragon ball, and check if Bulma is there
    Given path 'characters'
    When method get
    Then status 200

    * def humans = response.items.filter(x => x.race == 'Human')
    * karate.forEach(humans, x => karate.log('Human:', x.name))
    * def hasBulma = humans.some(x => x.name == 'Bulma')
    * match hasBulma == true
