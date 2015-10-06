# capybara-multiple-browsers

## Summary
Cucumber can run your scenarios with different browsers. Simply select the browser to use based on configuration property at runtime.

## Install/Configure Chrome and Safari Drivers

### Chrome
Edit Gemfile file

```
gem 'chromedriver2-helper'
```

### Safari

[How to use Safari](http://elementalselenium.com/tips/69-safari)

## Capybara + Cucumber
Edit support/env.rb file

```ruby
Capybara.register_driver :selenium do |app|
  $browser = (ENV['BROWSER'] || 'firefox').to_sym
  Capybara::Selenium::Driver.new(app, :browser => $browser)

end

Capybara.javascript_driver = $browser
```

## Runtime
Then, simply define the browser property when you run Cucumber

```
BROWSER=chrome cucumber 
```
