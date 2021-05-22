# How I developed this Ruby on Rails application #


## Event Tracker - Person ##


### Listing persons ###


#### Created git branch ####
I started off by creating a new feature branch *listing-people*. 
```bash
git checkout -b listing-people
```

#### Created the spec ####
I created the spec.
```bash
gedit spec/features/event-tracker/listing_people_spec.rb
```

```ruby
require "rails_helper"

RSpec.feature "Event Tracker - Listing People - " do
    
    before do
        @person1 = Person.create(first_name: "James",
                                  last_name: "Hetfield") 
        @person2 = Person.create(first_name: "Lars",
                                  last_name: "Ulrich") 
    end
    
    scenario "A user lists all people" do
        visit "/"
        click_link "Event Tracker"
        click_link "People"

        expect(page).to have_content(@person1.first_name)
        expect(page).to have_content(@person1.last_name)
        expect(page).to have_link("#{@person1.first_name} #{@person1.last_name}")

        expect(page).to have_content(@person2.first_name)
        expect(page).to have_content(@person2.last_name)
        expect(page).to have_link("#{@person2.first_name} #{@person2.last_name}")
   end
end
```

When I ran the new test in RSpec it gave me an error.
```bash
rspec spec/features/event-tracker/listing_people_spec.rb 
F*

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Listing people -  A user tries to lists all people but there are none
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/listing_people_spec.rb:26


Failures:

  1) Event tracker - Listing people -  A user lists all people
     Failure/Error: expect(page).to have_link("#{@person1.first_name} #{@person1.last_name}")
       expected to find link "James Hetfield" but there were no matches
```

#### Updated the index page ####
I updated the index page to show the full name as a link.
```bash
gedit app/views/people/index.html.erb
```

```ruby
<p id="notice"><%= notice %></p>

<h1>Listing People</h1>

<% @people.each do |person| %>
  <p><%= link_to "#{person.first_name} #{person.last_name}", person_path(person) %></p>
<% end %>

<br>

<%= link_to 'New Person', new_person_path %>
<%= link_to "Event Tracker", event_tracker_path %>
<%= link_to "Home", root_path %>
```

This time the test passed.
```bash
rspec spec/features/event-tracker/listing_people_spec.rb 
.

Finished in 0.17935 seconds (files took 1.12 seconds to load)
1 example, 0 failures
```

#### Added scenario for no people ####
I updated the spec and added a scenario for when there are no people to list.
```ruby
require "rails_helper"

RSpec.feature "Event tracker - Listing people - " do
    
    before do
        @person1 = Person.create(first_name: "James",
                                  last_name: "Hetfield") 
        @person2 = Person.create(first_name: "Lars",
                                  last_name: "Ulrich") 
    end
    
    scenario "A user lists all people" do
        visit "/"
        click_link "Event tracker"
        click_link "People"

        expect(page).to have_content(@person1.first_name)
        expect(page).to have_content(@person1.last_name)
        expect(page).to have_link("#{@person1.first_name} #{@person1.last_name}")

        expect(page).to have_content(@person2.first_name)
        expect(page).to have_content(@person2.last_name)
        expect(page).to have_link("#{@person2.first_name} #{@person2.last_name}")
   end

    scenario "A user tries to lists all people but there are none" do
       Person.delete_all
        visit "/"
        click_link "Event tracker"
        click_link "People"

        expect(page).not_to have_content(@person1.first_name)
        expect(page).not_to have_content(@person1.last_name)
        expect(page).not_to have_link("#{@person1.first_name} #{@person1.last_name}")

        expect(page).not_to have_content(@person2.first_name)
        expect(page).not_to have_content(@person2.last_name)
        expect(page).not_to have_link("#{@person2.first_name} #{@person2.last_name}")

        within ("h1#no-people") do
            expect(page).to have_content("No people have been created")
        end
    end
end
```

When I ran the new test in RSpec it gave me an error.
```bash
rspec spec/features/event-tracker/listing_people_spec.rb 
.F

Failures:

  1) Event tracker - Listing people -  A user tries to lists all people but there are none
     Failure/Error:
       within ("h1#no-people") do
           expect(page).to have_content("No people have been created")
       end
     
     Capybara::ElementNotFound:
       Unable to find css "h1#no-people"
```

### Updated the index view ###
I updated the index view to display a message when there are no people created.
```bash
gedit app/views/people/index.html.erb
```

```ruby
<p id="notice"><%= notice %></p>

<h1>Listing People</h1>

<% if @people.empty? %>
    <h1 id="no-people">No people have been created</h1>
<% else %>
    <% @people.each do |person| %>
      <p><%= link_to "#{person.first_name} #{person.last_name}", person_path(person) %></p>
    <% end %>
<% end %>


<br>

<%= link_to 'New person', new_person_path %>
<%= link_to "Event Tracker", event_tracker_path %>
<%= link_to "Home", root_path %>

```

This time the test passed.
```bash
rspec spec/features/event-tracker/listing_people_spec.rb 
..

Finished in 0.23517 seconds (files took 1.34 seconds to load)
2 examples, 0 failures
```


### Committed the changes ###
I confirmed that none of my tests failed before I committed the changes.
```bash
rspec spec/features/
.*.....

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Creating a person -  A user creates a new person (including uploading an image)
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/creating_person_spec.rb:18


Finished in 0.51397 seconds (files took 1.2 seconds to load)
7 examples, 0 failures, 1 pending
```

```bash
git status
git add -A
git commit -m "Event tracker - Implemented listing people"
git checkout event-tracker
git merge listing-people 
git push origin event-tracker
git branch -d listing-people 
Deleted branch listing-people (was 1d4a07c).
```

----------
[<< Previous Chapter](../section_3_event_tracker_person/3_1_creating_a_person) | [Table Of Contents](../how_i_developed_this_rails_application.md) | [Next Chapter >>](../section_3_event_tracker_person/3_3_showing_a_person.md)