# features/fail_serach.feature

Feature: Failed to Search for Paxos via google search


  Scenario Outline: Search paxos on google search engine
    Given I on the google search page
    When I search for <keyword>
    Then I should not see <result> on the result page

  Examples:
    | keyword  |      result       |
    | "patmos" | "Paxos Bankchain" |