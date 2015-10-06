require 'rspec/expectations'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'timeout'

Capybara.default_wait_time = 10

# To execute against other browsers pass environment variable from command line BROWSER=chrome or BROWSER=safari
Capybara.register_driver :selenium do |app|
  $browser = (ENV['BROWSER'] || 'firefox').to_sym
  Capybara::Selenium::Driver.new(app, :browser => $browser)

end

Capybara.javascript_driver = $browser