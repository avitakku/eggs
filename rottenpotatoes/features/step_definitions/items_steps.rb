
Given /the following items exist/ do |goods_and_services_table|
  goods_and_services_table.hashes.each do |item|
    cat = -1
    puts item
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

When /I submit the search form/ do
  click_button("Refresh")
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  Movie.all.each do |movie|
    step %{I should see "#{movie.title}"}
  end
end

Then(/^the director of "([^"]*)" should be "([^"]*)"$/) do |movie_title, director_name|
  movie = Movie.find_by_title(movie_title)
  expect(movie.director).to eq director_name
end

