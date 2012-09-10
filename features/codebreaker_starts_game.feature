Feature: Codebreaker starts game
  As a codebreaker
  In order to break the code
  I want to start the game

  Scenario: start game
    Given I am not yet playing
    When I start the game
    Then I should see "Welcome to CodeBreaker"
    And I should be prompted with "Enter your guess"
