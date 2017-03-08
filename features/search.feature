# features/search.feature

Feature: Searching for Paxos via google search
  As a user of google search, I want to be able to get search results for Paxos Bankchain
  So any potential customer can get information about Paxos Bankchain

  Scenario Outline: Search paxos on google search engine
    Given I on the google search page
    When I search for <keyword>
    Then I should see <result> on the result page
    And I should go to <result> homepage

  Examples:
    | keyword |      result       |
    | "paxos" | "Paxos Bankchain" |