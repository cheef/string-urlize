Given /^a string "([^"]*)"$/ do |string|
  @string = string
end

When /^I urlize it$/ do
  @result = @string.urlize
end

Then /^It should looks like "([^"]*)"$/ do |urlized_url|
  @result.should == urlized_url
end

When /^I urlize it with disabled transliteration$/ do
  @result = @string.urlize(:transliterate => false)
end

Then /^It should looks like "([^"]*)" in ruby "([^"]*)"$/ do |string, ruby_version|
  if RUBY_VERSION =~ /#{ruby_version}/
    @result.should == string
  end
end

