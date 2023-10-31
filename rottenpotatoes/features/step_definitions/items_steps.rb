
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
  click_button("Search")
end


When /^I click on the goods/service "(.*?)"$/ do |goods_service_name|
    click_link(goods_service_name)
  end

Then /^I confirm that I am on the "(.*?)" items page$/ do |goods_service_name|
    expect(page).to eq(goods_service_path(goods_service))
  end

And('I should see the name {string}') do |name|
    expect(page).to have_content(name)
end

And('I should see the email {string}') do |email|
    expect(page).to have_content(email)
end

When /^I fill in 'Search-bar' with "(.*?)"$/ do |keyword|
    fill_in('Search-bar', with: keyword)
  end
