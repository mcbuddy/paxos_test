# features/step_definitions/watir_helper.rb
require 'selenium-webdriver'
require 'watir-webdriver'
require 'yaml'
require 'set'

module SpecHelper

  def self.browser
    $obj = YAML::load(File.read(File.expand_path("../../../config/page_object.yml", __FILE__)))
    browser = Watir::Browser.new ENV['BROWSER']
    browser.window.resize_to(1600, 1200)
    browser.driver.manage.timeouts.implicit_wait = 10
    return browser
  end

end


