Given /^I have no clubs$/ do
  Club.delete_all
end

Given /^I (only )?have clubs titled "?([^\"]*)"?$/ do |only, titles|
  Club.delete_all if only
  titles.split(', ').each do |title|
    Club.create(:name => title)
  end
end

Then /^I should have ([0-9]+) clubs?$/ do |count|
  Club.count.should == count.to_i
end
