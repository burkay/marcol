#encoding: UTF-8

require 'capybara'
require 'capybara/dsl'
require 'capybara/rspec'
require 'rspec'
require 'json'
require 'net/http'
require 'rubygems'
require 'selenium-webdriver'
require 'capybara/cucumber'
require 'rest-client'
require 'pry'



Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end
Capybara.javascript_driver = :chrome
Capybara.configure do |config|
  config.default_max_wait_time = 5 # seconds
  config.default_driver        = :selenium
end

# API URL is set to given value for test
def set_api
  @api_url = "https://5d67b6b46847d40014f663fc.mockapi.io/users/"
end

# URL for UI tests is set to given value
def set_registrationForm
  @url = "https://docs.google.com/forms/d/e/1FAIpQLScNsgl6JzGTY5W-moSx1Upl1fTHxqUYss8S-xXBV9aVKMfTaQ/viewform"
end


Before do
  set_registrationForm
  set_api
end


# After do |scenario|
#   if scenario.failed?
#     screenshot_dir = 'screenshots'
#     Dir.mkdir(screenshot_dir) unless File.directory?(screenshot_dir)
#     filename = "./#{screenshot_dir}/error-#{scenario.name}-#{Time.now}.png"
#     browser.driver.save_screenshot(filename)
#     embed(filename, 'image/png')
#   end
#   # @browser.window.close if @browser.window.title.include?('Statement')
# end

 World(Capybara::DSL)