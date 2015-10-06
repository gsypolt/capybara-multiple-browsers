Given(/^i am on Gannett homepage$/) do
  visit 'http://www.gannett.com'
end

When(/^i click on "([^"]*)" button$/) do |button_text|
  link = find('a', :text => button_text)
  $expected_url = link[:href]
  link.click
end

Then(/^i should see the expected page$/) do
  expect(current_url).to match($expected_url)
end

