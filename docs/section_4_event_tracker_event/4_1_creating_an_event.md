# How I developed this Ruby on Rails application #


## Event Tracker - Event ##


### Creating an event ###


#### Created git branch ####
I started off by creating a new feature branch *creating-event*. 
```bash
git checkout -b creating-event
```


#### Created the spec ####
I created the spec.
```bash
gedit spec/features/event-tracker/creating_event_spec.rb
```

```ruby
require "rails_helper"

RSpec.feature "Event tracker - Creating an event - " do
    scenario "A user creates a new event without uploading an image" do
        visit "/"
        click_link "Event tracker"
        click_link "Event"
        click_link "New event"

        fill_in "Title", with: "Niklas Bergstrom's Birthday"
        fill_in "Details", with: "Niklas was born in Stockholm on 17 February 1974"
        fill_in "Day", with: "17"
        fill_in "Month", with: "2"
        fill_in "Year", with: "1974"
        click_button "Create an event"

        expect(page).to have_content("Event was successfully created")
        expect(current_path).to eq(event_path(Event.last.id)) 
    end

    xscenario "A user creates a new event including uploading an image" do
   end

    scenario "A user fails to create a new event" do
        visit "/"
        click_link "Event tracker"
        click_link "People"
        click_link "New person"

        fill_in "Title", with: ""
        fill_in "Details", with: ""
        fill_in "Day", with: ""
        fill_in "Month", with: ""
        fill_in "Year", with: ""
        click_button "Create an event"

        expect(page).to have_content("1 error prohibited this event from being saved:")
        expect(page).to have_content("Title can't be blank")
        expect(current_path).to eq(people_path) 
    end
end
```

When I ran the new test in RSpec it gave me an error.
```bash
rspec spec/features/event-tracker/creating_an_event_spec.rb 
F*F

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Creating an event -  A user creates a new event including uploading an image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/creating_an_event_spec.rb:21


Failures:

  1) Event tracker - Creating an event -  A user creates a new event without uploading an image
     Failure/Error: click_link "Event"
     
     Capybara::ElementNotFound:
       Unable to find link "Event"
```


#### Generated the model ####
The next thing I did was to generate the *Event* model using scaffolding.
```bash
rails g scaffold Event title:string details:text day:integer month:integer year:integer main_image:text thumb_image:text
```

I reviewed the migration file before running the migration to ensure everything was as expected.
```bash
gedit db/migrate/20210520072147_create_events.rb
rails db:migrate
== 20210520072147 CreateEvents: migrating =====================================
-- create_table(:events)
   -> 0.0452s
== 20210520072147 CreateEvents: migrated (0.0454s) ============================
```


#### Added a link to event tracker landing page ####
I added a link the event tracker landing page.
```bash
gedit app/views/pages/event_tracker.html.erb
```

```ruby
<h1>Event tracker</h1>

<%= link_to 'People', people_path %>
<%= link_to 'Events', events_path %>
<%= link_to "Home", root_path %>
```


When I re-ran the test in RSpec it gave me an error.
```bash
rspec spec/features/event-tracker/creating_an_event_spec.rb 
F*F

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Creating an event -  A user creates a new event including uploading an image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/creating_an_event_spec.rb:21


Failures:

  1) Event tracker - Creating an event -  A user creates a new event without uploading an image
     Failure/Error: click_link "New event"
     
     Capybara::ElementNotFound:
       Unable to find link "New event"
```


#### Updated the index page ####
I updated the index page.
```bash
gedit app/views/events/index.html.erb
```

```ruby
<p id="notice"><%= notice %></p>

<h1>Listing events</h1>

<% if @events.empty? %>
    <h1 id="no-events">No events have been created</h1>
<% else %>
    <% @events.each do |event| %>
     <p><%= link_to "#{event.titel.titleize}", event_path(event) %></p>
    <% end %>
<% end %>


<br>

<%= link_to 'New event', new_event_path %> | <%= link_to "Event tracker", event_tracker_path %> | <%= link_to "Home", root_path %>
```



#### Committing the changes ####
I confirmed that none of my tests failed before I committed the changes.
```bash
rspec spec/features/
.*..

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Creating a person -  A user creates a new person (including uploading an image)
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/creating_person_spec.rb:18


Finished in 0.44885 seconds (files took 2.88 seconds to load)
4 examples, 0 failures, 1 pending
```bash

```bash
git status
git add -A 
git commit -m "Event tracker - Implemented creating person"
```

#### Added datavalidation ####
I updated the spec to inclue a negative scenario.
```ruby
    scenario "A user fails to create a new person" do
        visit "/"
        click_link "Event tracker"
        click_link "People"
        click_link "New person"

        fill_in "First name", with: ""
        fill_in "Last name", with: ""
        click_button "Create Person"

        expect(page).to have_content("2 errors prohibited this person from being saved:")
        expect(page).to have_content("First name can't be blank")
        expect(page).to have_content("Last name can't be blank")

        expect(current_path).to eq(people_path) 
    end
```

When I ran the updates spec in RSpec it gave me an error.
```bash
rspec spec/features/event-tracker/creating_person_spec.rb 
.*F

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Creating a person -  A user creates a new person (including uploading an image)
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/creating_person_spec.rb:18


Failures:

  1) Event tracker - Creating a person -  A user fails to create a new person
     Failure/Error: expect(page).to have_content("2 errors prohibited this person from being saved:")
       expected to find text "2 errors prohibited this person from being saved:" in "Person was successfully created.\nFirst name:\nLast name:\nMain image:\nThumb image:\nEdit | Back"
```       

### Updated the person model ###
I updated the person model and added data validation to it.
```bash
gedit  app/models/person.rb
```

```ruby
class Person < ApplicationRecord
    validates :first_name, :last_name, presence: true
end
```

When I re-ran the spec in RSpec worked as expected.
```bash
rspec spec/features/event-tracker/creating_person_spec.rb 
.*.

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Creating a person -  A user creates a new person (including uploading an image)
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/creating_person_spec.rb:18


Finished in 0.36839 seconds (files took 1.1 seconds to load)
3 examples, 0 failures, 1 pending
```

### Committed the changes ###
I confirmed that none of my tests failed before I committed the changes.
```bash
rspec spec/features/
.*..*....**.....***..

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Creating a person -  A user creates a new person including uploading an image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/creating_a_person_spec.rb:18

  2) Event tracker - Creating an event -  A user creates a new event including uploading an image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/creating_an_event_spec.rb:21

  3) Event tracker - Editing a person -  A user updates a person including uploading a new image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/editing_a_person_spec.rb:47

  4) Event tracker - Editing a person -  A user updates a person and removes the uploaded image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/editing_a_person_spec.rb:50

  5) Event Tracker - Showing A Person -  A user shows a person with an uploaded image - Name entered in lowercase letters
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/showing_a_person_spec.rb:56

  6) Event Tracker - Showing A Person -  A user shows a person witht an uploaded image - Name entered in uppercase letters
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/showing_a_person_spec.rb:59

  7) Event Tracker - Showing A Person -  A user shows a person with an uploaded image - Name entered in capitalized letters
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/showing_a_person_spec.rb:62


Finished in 1.14 seconds (files took 1.08 seconds to load)
21 examples, 0 failures, 7 pending
```

```bash
git status
git add -A
git commit -m "Event tracker - Implemented creating event"
git checkout event-tracker
git merge create-event
git push origin event-tracker
git branch -d create-event 
```



----------
[<< Previous Chapter](../section_4_event_tracker_event/4_0_event_tracker_event_toc.md) | [Table Of Contents](../how_i_developed_this_rails_application.md) | [Next Chapter >>](../section_4_event_tracker_event/4_2_listing_events.md)