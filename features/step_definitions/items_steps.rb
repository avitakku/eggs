
Given /the following items exist/ do |goods_and_services_table|
  goods_and_services_table.hashes.each do |item|
    cat = -1
    if item[:category].eql?("Good")
      cat = 0
    else
      cat = 1
    end
    GoodsAndService.create!(user_id: "94213", name: item[:name], category: cat, description: item[:description])
  end
end

=begin
Given /the following users exist/ do |profile_table|
    profile_table.hashes.each do |user|
      
      UserInformation.create!(user_id: "94213", name: item[:name], category: cat, description: item[:description])
    end
  end
=end

When /^I visit the "(.*?)" profile page$/ do |name|
  #puts page.body
  
end 

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  expect(page.body.index(e1) < page.body.index(e2))
end

When /I (un)?check the following categories: (.*)/ do |uncheck, categories_list|
  categories_list.split(', ').each do |category|
    step %{I #{uncheck.nil? ? '' : 'un'}check "categories_#{category}"}
  end
end

Then /I should (not )?see the following items: (.*)$/ do |bool, items_list|
  items = items_list.split(',').map(&:strip)

  items.each do |item|
    if bool == "not "
      expect(page).not_to have_content(item)
    else 
      expect(page).to have_content(item)
    end
  end
end

When /I click the refresh button/ do
  click_button("Refresh")
end

When /I click the search button/ do
  puts "Current URL: #{current_url}"
  click_button("Search")
  puts "After clicking, URL: #{current_url}"
end

When(/^I click on the goods\/service "([^"]*)"$/) do |item_name|
  #puts page.body debugging
  click_link(item_name)
end

Then /^I confirm that I am on the "(.*?)" item page$/ do |goods_service_name|
  item = GoodsAndService.find_by(name: goods_service_name)
  expect(item).not_to be_nil

  expect(current_path).to eq(goods_service_path(item))
end

Then /I should see the name "(.*)"/ do |name|
  #puts page.body
  expect(page).to have_content(name)
end

Then /I should see the email "(.*)"/ do |email|
  expect(page).to have_content(email)
end

When /^I fill in 'Search-bar' with "(.*?)"$/ do |keyword|
    fill_in('Search-bar', with: keyword)
end

When /I click on the Edit Profile link/ do
    click_link("Edit Profile")
end

Then /^I confirm that I am on the "(.*?)" profile page$/ do |name|
  #puts page.body
  expect(current_path).to eq("/profile")
end

Then /^I confirm that I am on the "(.*?)" friend page$/ do |name|
  #puts page.body
  expect(page).to have_content(name)
end

Then /^I confirm that I am on the "Users" page$/ do
  #puts page.body
  expect(current_path).to eq("/users")
end

Then /I should see the username "(.*)"/ do |username|
  expect(page).to have_content(username)
end

Then /I should see the address "(.*)"/ do |address|
  expect(page).to have_content(address)
end

Then /I should see the contact "(.*)"/ do |contact|
  expect(page).to have_content(contact)
end

Then /I should see a rating of "(.*)"/ do |rating|
  expect(page).to have_content(rating)
end

And /^the following items should exist:$/ do |table|
  table.hashes.each do |item|
    category = (item['category'] == 'Good' ? 0 : 1) 
    GoodsAndService.create!(name: item['name'], category: category) 
  end
end

And /^the following users should exist:$/ do |table|
    table.hashes.each do |user| 
      UserInformation.create(name: user['Name'], contact_information: user['Contact Info'])
    end
end

When(/^I click on the Offer a new good\/service link$/) do
  click_link('Offer a new good/service') 
end

Then(/^I confirm that I am on the Offer a New Good or Service page$/) do
  expect(current_path).to eq(new_goods_service_path) 
end

Then("I should see a text box for name") do
  expect(page).to have_css('input#goods_service_name')
end

Then("I should see a text box for item description") do
  expect(page).to have_css('textarea#goods_service_description')
end

Then("I should see a Post button") do
  expect(page).to have_css('input[type="submit"][name="commit"]')
end


Given(/^I visit the "Offer a New Good or Service" page$/) do
  visit new_goods_service_path 
end

Given(/^I visit the "Profile" page$/) do
    visit "/profile" 
end

When(/^I fill in value for "(.*?)" with "(.*?)"$/) do |field, value|
  fill_in(field, with: value)
end

When(/^I select category "(.*?)" from "(.*?)"$/) do |category, field|
  select(category, from: field)
end

=begin
When(/^I click the "Post" button$/) do
  click_button('Post') 
end
=end

When("I click the {string} button") do |string|
  click_button(string) 
end

When(/^I press the "Add Friends" link$/) do
  visit "/users"
end

When(/^I press the "Edit" link$/) do 
  click_link("Edit")
end

When("I click the {string} link") do |string|
  click_link(string)
end

When ("I click on my friend {string}") do |string|
  click_link(string)
end

Then(/^I should see the new item "(.*?)" on my profile$/) do |item_name|
  expect(page).to have_content(item.name)
end

