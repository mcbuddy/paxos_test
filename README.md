
# Paxos QA Automation Test

## Setup
## Install programs to Unix-based Machine

- ruby version 2.3.0
- rvm/rbenv
- selenium-webdriver 
- watir-webdriver
- chromedriver download using command 
    for linux `wget http://chromedriver.storage.googleapis.com/2.27/chromedriver_linux64.zip`
    for mac `wger https://chromedriver.storage.googleapis.com/2.27/chromedriver_mac64.zip`
- for other browser driver please visit http://www.seleniumhq.org/

##Task 

Feature: searching for Paxos via google search
  As a user of google search
  I want to be able to get search results for Paxos Bankchain
  So any potential customer can get information about Paxos Bankchain
  
For the above Feature:

- Write a gherkin scenario: located on `features/search.feature`
- Write step defs and any needed code to run the feature file in cucumber: located on `features/step_definitions/search.rb`
- Verify the browser url includes the searched term (paxos): located on `features/step_definitions/search.rb:23`
- Verify Paxos Bankchain appears on the search results page: located on `features/step_definitions/search.rb:29`
- Facilitate the test to run the test for different browsers: located on `config/cucumber.yml` by change the browser profile
- Reporting of the status test cases: generated by cucumber in the console/terminal 

- Use a POM (Page Object Model) (bonus): located on `config/page_object.yml`
- Use a data file so the user can search for multiple terms listed in the file (bonus): I created Scenario Outline on the feature file, so user can add other term for search in the google
- Error handling and negative test scenarios (bonus): Not sure abt this, but I created `features/fail_search.rb`


