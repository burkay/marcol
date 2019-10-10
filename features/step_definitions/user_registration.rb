require_relative '../../features/page_objects/user_from.rb'

Given(/^I am on the test registration page/) do
  #User Registration Form page defined in env.rb
  visit @url
end

And(/^fill in password$/) do
  name.set('Name')
  email.set('Email')
  dateOfBirth.set('01.01.2001')
  phoneNumber.set('0884123456')
  gender('Female').click
end

And(/^I fill the form with:$/) do |table|
  userValues=Hash[table.raw]
  name.set(userValues['Name'])
  email.set(userValues['Email'])
  dateOfBirth.set(userValues['Date_of_Birth'])
  phoneNumber.set(userValues['Phone_Number'])

  if userValues['Gender'] == "Male"
    selectMale.click
  elsif userValues['Gender'] == "Female"
    selectFemale.click
  end

  if userValues['Country'] == "Bulgaria"
    selectBulgaria
  end

  if userValues['City'] == "Sofia"
    selectSofia
  end
  waitListGetSelected

  streetAddress.set(userValues['Street_Address'])
end

Then(/^I see "([^"]*)" message$/) do |msg|
  expect(page).to have_content msg
end

When(/^I click submit$/) do
  #page.find('.quantumWizButtonPaperbuttonLabel.exportLabel').click
  submitButton.click
end


Then(/^I should see a field required message$/) do
  #error msg shown in Bulgarian
  expect(page).to have_content "Това е задължителен въпрос"
end

Then(/^I should see a field valid email required message$/) do
  expect(page).to have_content "A valid email address is required!"
end
