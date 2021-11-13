----------
[<< Previous Chapter](../section_3_event_tracker_person/3_2_listing_people) | [Table Of Contents](../how_i_developed_this_rails_application.md) | [Next Chapter >>](../section_3_event_tracker_person/3_4_editing_a_person.md)
----------


# How I developed this Ruby on Rails application #


## Event tracker - Person ##


### Showing a person ###


#### Created git branch ####
I started off by creating a new feature branch *showing-person*. 
```bash
git checkout -b showing-person
```

#### Created the spec ####
I created the spec.
```bash
gedit spec/features/event-tracker/showing_a_person_spec.rb
```

```ruby
require "rails_helper"

RSpec.feature "Event Tracker - Showing A Person - " do
    
    before do
        @person1 = Person.create(first_name: "kirk",
                                  last_name: "hammet") 
        @person2 = Person.create(first_name: "JAMES",
                                  last_name: "HETFIELD") 
        @person3 = Person.create(first_name: "Lars",
                                  last_name: "Ulrich") 
    end
    
    scenario "A user shows a person without an uploaded image - Name entered in lowercase letters" do
        visit "/"
        click_link "Event tracker"
        click_link "People"
        click_link "Kirk Hammet"

        expect(page).to have_content("Kirk Hammet")
        expect(page).to have_link("Edit person")
        expect(page).to have_link("Back")
        expect(page).to have_link("Home")

        expect(current_path).to eq(person_path(@person1))
   end
   
    scenario "A user shows a person without an uploaded image - Name entered in uppercase letters" do
        visit "/"
        click_link "Event tracker"
        click_link "People"
        click_link "James Hetfield"

        expect(page).to have_content("James Hetfield")
        expect(page).to have_link("Edit person")
        expect(page).to have_link("Back")
        expect(page).to have_link("Home")

        expect(current_path).to eq(person_path(@person2))
   end

    scenario "A user shows a person without an uploaded image - Name entered in capitalized letters" do
        visit "/"
        click_link "Event tracker"
        click_link "People"
        click_link "Lars Ulrich"

        expect(page).to have_content("Lars Ulrich")
        expect(page).to have_link("Edit person")
        expect(page).to have_link("Back")
        expect(page).to have_link("Home")

        expect(current_path).to eq(person_path(@person3))
   end

    xscenario "A user shows a person with an uploaded image - Name entered in lowercase letters" do
    end

    xscenario "A user shows a person witht an uploaded image - Name entered in uppercase letters" do
    end
    
    xscenario "A user shows a person with an uploaded image - Name entered in capitalized letters" do
    end
    
end
```

When I ran the new test in RSpec it gave me an error.
```bash
rspec spec/features/event-tracker/showing_a_person_spec.rb 
FF.***

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event Tracker - Showing A Person -  A user shows a person with an uploaded image - Name entered in lowercase letters
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/showing_person_spec.rb:56

  2) Event Tracker - Showing A Person -  A user shows a person witht an uploaded image - Name entered in uppercase letters
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/showing_person_spec.rb:59

  3) Event Tracker - Showing A Person -  A user shows a person with an uploaded image - Name entered in capitalized letters
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/showing_person_spec.rb:62


Failures:

  1) Event Tracker - Showing A Person -  A user shows a person without an uploaded image - Name entered in lowercase letters
     Failure/Error: click_link "Kirk Hammet"
     
     Capybara::ElementNotFound:
       Unable to find link "Kirk Hammet"
```



### Titleized the names ###
I wanted to ensure that all persons names are written with the first letter capitalised regardles of how they were entered into the system. To do that I used the Ruby method *titleize*. After that I updated the index view file to include this method.
```bash
gedit app/views/people/index.html.erb
```

```ruby
<p id="notice"><%= notice %></p>

<h1>Listing people</h1>

<% if @people.empty? %>
    <h1 id="no-people">No people have been created</h1>
<% else %>
    <% @people.each do |person| %>
      <p><%= link_to "#{person.first_name.titleize} #{person.last_name.titleize}", person_path(person) %></p>
    <% end %>
<% end %>


<br>

<%= link_to 'New person', new_person_path %> | <%= link_to "Event tracker", event_tracker_path %> | <%= link_to "Home", root_path %>
```

When I ran the new test in RSpec it gave me the next error.
```bash
rspec spec/features/event-tracker/showing_a_person_spec.rb 
FFF***

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event Tracker - Showing A Person -  A user shows a person with an uploaded image - Name entered in lowercase letters
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/showing_person_spec.rb:56

  2) Event Tracker - Showing A Person -  A user shows a person witht an uploaded image - Name entered in uppercase letters
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/showing_person_spec.rb:59

  3) Event Tracker - Showing A Person -  A user shows a person with an uploaded image - Name entered in capitalized letters
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/showing_person_spec.rb:62


Failures:

  1) Event Tracker - Showing A Person -  A user shows a person without an uploaded image - Name entered in lowercase letters
     Failure/Error: expect(page).to have_content("Kirk Hammet")
       expected to find text "Kirk Hammet" in "First name: kirk\nLast name: hammet\nMain image:\nThumb image:\nEdit | Back"
```


### Updated the show page ###
I updated the show page.
```bash
gedit app/views/people/show.html.erb
```

```ruby
<p id="notice"><%= notice %></p>

<h1><%= @person.first_name.titleize %> <%= @person.last_name.titleize %> </h1>


<%= link_to 'Edit person', edit_person_path(@person) %> | <%= link_to 'Back', people_path %> | <%= link_to "Home", root_path %>
```

When I ran the new test in RSpec it worked as expected .
```bash
rspec spec/features/event-tracker/showing_a_person_spec.rb 
...***

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event Tracker - Showing A Person -  A user shows a person with an uploaded image - Name entered in lowercase letters
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/showing_person_spec.rb:56

  2) Event Tracker - Showing A Person -  A user shows a person witht an uploaded image - Name entered in uppercase letters
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/showing_person_spec.rb:59

  3) Event Tracker - Showing A Person -  A user shows a person with an uploaded image - Name entered in capitalized letters
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/showing_person_spec.rb:62


Finished in 0.3966 seconds (files took 1.12 seconds to load)
6 examples, 0 failures, 3 pending
```

### Updated the listing people spec ###
I updated the listing people spec and the index page to support the names in either lower case, upper case or capitalized.


### Committed the changes ###
I confirmed that none of my tests failed before I committed the changes.
```bash
rspec spec/features/
.*......***..

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Creating a person -  A user creates a new person including uploading an image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/creating_person_spec.rb:18

  2) Event Tracker - Showing A Person -  A user shows a person with an uploaded image - Name entered in lowercase letters
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/showing_person_spec.rb:56

  3) Event Tracker - Showing A Person -  A user shows a person witht an uploaded image - Name entered in uppercase letters
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/showing_person_spec.rb:59

  4) Event Tracker - Showing A Person -  A user shows a person with an uploaded image - Name entered in capitalized letters
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/showing_person_spec.rb:62


Finished in 0.70796 seconds (files took 1.16 seconds to load)
13 examples, 0 failures, 4 pending

```

```bash
git status
git add -A
git commit -m "Event tracker - Implemented showing a person"
git checkout event-tracker
git merge showing-person 
git push origin event-tracker
git branch -d showing-person
Deleted branch showing-person (was ca38007).
```

----------
[<< Previous Chapter](../section_3_event_tracker_person/3_2_listing_people) | [Table Of Contents](../how_i_developed_this_rails_application.md) | [Next Chapter >>](../section_3_event_tracker_person/3_4_editing_a_person.md)