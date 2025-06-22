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

  Scenario: get the number of planets
    Given path 'planets'
    When method get
    Then status 200

    * def numberOfPlanets = response.items.length
    * def actualNumberOfPlanets = 10
    * match numberOfPlanets == actualNumberOfPlanets

  Scenario: Piccolo is a namekian (planet id = 1)
    Given path 'planets/1'
    When method get
    Then status 200

    * def namekians = response.characters
    * karate.forEach(namekians, x => karate.log('Namekian:', x.name))
    * def piccoloIsNamekian = namekians.some(x => x.name == 'Piccolo')
    * match piccoloIsNamekian == true

  Scenario: Piccolo, Nail and Dende
    Given path 'planets/1'
    When method get
    Then status 200

    * def namekians = response.characters
    * karate.forEach(namekians, x => karate.log('Namekian:', x.name))
    * def piccoloIsNamekian = namekians.some(x => x.name == 'Piccolo')
    * def nailIsNamekian = namekians.some(x => x.name == 'Nail')
    * def dendeIsNamekian = namekians.some(x => x.name == 'Dende')
    * match piccoloIsNamekian == true
    * match nailIsNamekian == true
    * match dendeIsNamekian == true

    Scenario: get Z fighters
      Given path 'characters'
      When method get
      Then status 200

    * def zFighters = response.items.filter(x => x.affiliation == 'Z Fighter')
    * def expectedNumberOfZFighters = zFighters.length
    * def actualNumberOfZFighters = 5
    * match expectedNumberOfZFighters == actualNumberOfZFighters