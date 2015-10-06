require 'rspec/expectations'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'timeout'

Capybara.default_wait_time = 10

# To execute against other browsers pass environment variable from command line BROWSER=chrome
# Safari is a work in progress
Capybara.register_driver :selenium do |app|
  capabilities = {
        :nativeEvents => false,
        :acceptSslCerts => true
  }

  $browser = (ENV['BROWSER'] || 'firefox').to_sym
  Capybara::Selenium::Driver.new(app, :browser => $browser, :desired_capabilities => capabilities)

end

Capybara.javascript_driver = $browser