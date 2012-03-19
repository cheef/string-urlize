Given /^a string "([^"]*)"$/ do |string|
  @string = string
end

When /^I urlize it$/ do
  @result = @string.urlize
end

Then /^It should looks like "([^"]*)"$/ do |urlized_url|
  @result.should == urlized_url
end

When /^I urlize it with enabled accents replacement$/ do
  @result = @string.urlize :replace_accents => true
end

