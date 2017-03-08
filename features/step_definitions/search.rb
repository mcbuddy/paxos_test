require_relative 'spec_helper'
include SpecHelper

Before do |scenario|
  @browser = SpecHelper.browser
end

After do |scenario|
  @browser.quit
end


Given(/^I on the google search page$/) do
  @browser.goto(ENV['URI'])
  expect(@browser.url).to include(ENV['URI'])
end

When(/^I search for "([^"]*)"$/) do |keyword|
  @browser.text_field(id: $obj['SEARCH_BAR']['ID']).set(keyword)
  @browser.send_keys :enter
  @browser.element(id: $obj['RESULT_PAGE']['ID']).wait_until_present
  expect(@browser.url).to include(keyword)
end

Then(/^I should see "([^"]*)" on the result page$/) do |keywords|
  @browser.elements(class: $obj['RESULT_QUERIES']['CLASS']).each do |elm|
    # comparing string from google result with given keywords then assign the link to variable
    if keywords.split.to_set.subset? elm.h3.text.split.to_set
      @result_title = elm.h3.text
      @result_link = elm.h3.a.attribute_value('href')
    end
  end
end

Then(/^I should go to "([^"]*)" homepage$/) do |result|
  @browser.goto(@result_link)
  expect(result.split.to_set.subset? @browser.title.split.to_set).to eql(true)
  expect(@browser.title).to eql(@result_title)
end

Then(/^I should not see "([^"]*)" on the result page$/) do |keyword|
  @browser.elements(class: $obj['RESULT_QUERIES']['CLASS']).each do |elm|
    # interate results and make sure it does not have or contain any keyword
    expect(elm.h3.text).not_to eql(keyword)
    expect(elm.h3.text).not_to include(keyword)
   end
end