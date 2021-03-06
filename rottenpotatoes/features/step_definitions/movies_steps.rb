
Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create movie
  end
end

#Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
 # expect(page.body.index(e1) < page.body.index(e2))
#end

#When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
#  rating_list.split(', ').each do |rating|
 #   step %{I #{uncheck.nil? ? '' : 'un'}check "ratings_#{rating}"}
  #end
#end

#Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
 # Movie.all.each do |movie|
  #  step %{I should see "#{movie.title}"}
  #end
#end

Then /the director of "([^"]*)" should be "([^"]*)"/ do |movie_title, movie_director|
  #movie = Movie.where(title: movie_title)
  if (Movie.find_by(:title => movie_title, :director => movie_director) == nil)
    fail "Failed"
  end
end

Then /(.*) seed movies should exist/ do | n_seeds |
# Make sure that one string (regexp) occurs before or after another one
#   on the same page
  Movie.count.should be n_seeds.to_i
end

When /^(?:|I )follows "(.*)"/ do |link|
  click_link(link)
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  text=page.body.split(e2)
  text[0].should have_content(e1)
  #fail "Unimplemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I press "(.*)" button/ do |button|
  click_button(button)
end

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  ratings = rating_list.split(', ')
  ratings.each do |rating|
    uncheck ? uncheck("ratings[#{rating}]") : (check("ratings[#{rating}]"))
  end
  #@movie = Movie.where(rating_list)
  #end
end

#When ('I uncheck (.*)') do |rating_list|
#    rating_list.each do | rating1 |
#      check(rating1)
#    end
#  #fail "Unimplemented"
#end

Then /there should be (.*) movies that are (.*)/ do |n, rating_list|
  count = Movie.where(rating: rating_list).count
  #ratings = rating_list.split(',')
  #ratings.each do |rating|
   # count = count + Movie.where("ratings[#{rating}]").count
  #end
  #count.should be n.to_i
  puts Movie.with_ratings(rating_list)["title"]
end

Then /^(?:|I )should see this (.*)/ do |text|
  text1 = text.split(', ')
  text1.each do |text2|
    #if page.respond_to? :should
    page.should have_content(text2)
    #else
     # assert page.has_content?(text2)
    #end
  end
end

Then /^(?:|I )should not see this (.*)/ do |text|
  text1 = text.split(', ')
  text1.each do |text2|
    #if page.respond_to? :should
    page.should have_no_content(text2)
    #else
     # assert page.has_content?(text2)
    #end
  end
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  #@movie = Movie.all
  Movie.all.each do |movie|
    page.should have_content(movie["title"])
  end
  #expect(rows).to eq value 10
  #fail "Unimplemented"
end
  