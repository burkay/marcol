When(/^I call the API for creating a user$/) do

  #after making a POST request checking if the response is "200". If not returning response code with an error msg
  begin
    createUser = JSON.parse RestClient.post @api_url, {}
  rescue RestClient::ExceptionWithResponse => e
    if e.response == 200
      else raise "User is not created "+e.response
    end
  end

  @userId = createUser['id']

end

Then(/^User should be created$/) do
     begin
      RestClient.get @api_url+@userId
     rescue RestClient::ExceptionWithResponse => e
       if e.response.code == 200
        else raise "Error, returned "+e.response
       end
     end
end

And(/^I call the API for editing user$/) do
  updateUser = JSON.parse RestClient.put @api_url+@userId, {}
  @updatedUserName = updateUser['name']
end

And(/^I call the API for deleting user$/) do
  puts "User will be deleted: "+@userId
  JSON.parse RestClient.delete @api_url+@userId, {}
end

Then(/^User should be deleted$/) do

  begin
    JSON.parse RestClient.get @api_url+@userId
  rescue RestClient::ExceptionWithResponse => e
    if e.response.code == 404
      else raise "Error! User is found :"+@userId
    end
  end
  puts "User is deleted: "+@userId
end

And(/^I change user name as "([^"]*)"$/) do |name|
  RestClient.put( @api_url+@userId, {:name => name}  )
end

Then(/^User name should be "([^"]*)"$/) do |name|
  user = JSON.parse RestClient.get @api_url+@userId
  if user['name'] == name
  else raise "Name is not updated"
  end
end

And(/^I change phone number as "([^"]*)"$/) do |phone|
  RestClient.put( @api_url+@userId, {:phoneNumber => phone}  )
end

Then(/^phone number should be "([^"]*)"$/) do |phone|
  user = JSON.parse RestClient.get @api_url+@userId
  if user['phoneNumber'] == phone
    else raise "Phone is not updated"
  end
end

Then(/^User should be created with details:$/) do |table|
  # table is a table.hashes.keys # => [:Name, :Benjamin Kane]
  userValues = Hash[table.raw]

  userDetails = JSON.parse RestClient.get @api_url+@userId

  userValues['Name'] == userDetails['name']
  userValues['Date_of_Birth'] == userDetails['dateOfBirth']
  userValues['Phone_Number'] == userDetails['phoneNumber']
  userValues['Email'] == userDetails['email']
end

When(/^I call the API for creating a user with data:$/) do |table|
  userValues = Hash[table.raw]

  user = JSON.parse RestClient.post( @api_url,
                   {
                       :name => userValues['Name'],
                       :dateOfBirth => userValues['Date_of_Birth'],
                       :phoneNumber => userValues['Phone_Number'],
                       :email=>userValues['Email']
                   })

  @userId = user['id']
  puts "UserId: "+@userId
end