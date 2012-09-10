Feature: Codebreaker submits guess
  As a codebreaker
  I want to submit a guess
  So I can win

  A codebreaker submits a guess of 4 mumbers. The game marks the guess with '+' and '-' signs
  If there is an exact match it returns a +. If there's a number match but the position is wrong it returns a -.
  The marks do not match the position of the numbers in the code. In the mark + signs precede the - signs.

  Scenario Outline: submit guess
    Given the code is "<code>"
    When I submit "<guess>"
    Then I should get the mark "<mark>"

    Scenarios: all exact matches
      | code | guess | mark |
      | 1234 | 1234  | ++++ |
    
      
      Scenarios: No matches
      | code | guess | mark |
      | 1234 | 6789  |      |

    Scenarios: 1 number correct 
      | code | guess | mark | 
      |1234  |1555   |+     | 
      |1234  |2555   |-     |
    
    Scenarios: 2 numbers correct 
      | code | guess | mark | 
      |1234  |5254   |++ | 
      |1234  |5154   |+- | 
      |1234  |2545   |-- |
    
    Scenarios: 3 numbers correct 
      | code | guess | mark | 
      |1234  |5234   |+++ | 
      |1234  |5134   |++- | 
      |1234  |5124   |+-- | 
      |1234  |5123   |--- |
    
    Scenarios: all numbers correct 
      | code | guess | mark | 
      |1234  |1234   |++++  | 
      |1234  |1243   |++--  | 
      |1234  |1423   |+---  | 
      |1234  |4321   |----  |
