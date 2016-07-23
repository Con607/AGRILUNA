Given(/^there's a company named "(.*?)" with "(.*?)" description$/) do |name, description|
  @company = FactoryGirl.create(:company, name: name, description: description)
end

When(/^I am on the companies index$/) do
  visit companies_path
end

Then(/^I should see the "(.*?)" company$/) do |name|
  @company = Company.find_by_name(name)

  page.should have_description(@company.name)
  page.should have_description(@company.description)
end