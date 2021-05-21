# How I developed this Ruby on Rails application #


## Event Tracker - Event ##


### Listing events ###


#### Created git branch ####
I started off by creating a new feature branch *listing-events*. 
```bash
git checkout -b listing-events
```

#### Created the spec ####
I created the spec.
```bash
gedit spec/features/event-tracker/listing_events_spec.rb
```

```ruby
require "rails_helper"

RSpec.feature "Event tracker - Listing events - " do
    
    before do
        @event1 = Event.create(title: "Kirk Hammet's birthday",
                                details: "Kirk Lee Hammett was born on November 18, 1962",
                                day: "18",
                                month: "11",
                                year: "1962")
        @event2 = Event.create(title: "James Hetfield's birthday",
                                details: "James Alan Hetfield was born on August 3, 1963)",
                                day: "3",
                                month: "8",
                                year: "1963")
        @event3 = Event.create(title: "Lars Ulrich's birthday",
                                details: "Lars Ulrich was born on December 26, 1963)",
                                day: "26",
                                month: "12",
                                year: "1963")
    end

    scenario "A user lists all events" do
        visit "/"
        click_link "Event tracker"
        click_link "Events"

        expect(page).to have_content("Kirk Hammet's birthday")
        expect(page).to have_link("Kirk Hammet's birthday")
        expect(page).to have_content("1962-11-18")

        expect(page).to have_content("James Hetfield's birthday")
        expect(page).to have_link("James Hetfield's birthday")
        expect(page).to have_content("1963-08-03")

        expect(page).to have_content("Lars Ulrich's birthday")
        expect(page).to have_link("Lars Ulrich's birthday")
        expect(page).to have_content("1963-12-26")
   end

    scenario "A user tries to lists all events but there are none" do
       Event.delete_all
        visit "/"
        click_link "Event tracker"
        click_link "Events"

        expect(page).not_to have_content("Kirk Hammet's birthday")
        expect(page).not_to have_link("Kirk Hammet's birthday")
        expect(page).not_to have_content("1962-11-18")

        expect(page).not_to have_content("James Hetfield's birthday")
        expect(page).not_to have_link("James Hetfield's birthday")
        expect(page).not_to have_content("1962-08-03")

        expect(page).not_to have_content("Lars Ulrich's birthday")
        expect(page).not_to have_link("Lars Ulrich's birthday")
        expect(page).not_to have_content("1962-12-26")

        within ("h1#no-events") do
            expect(page).to have_content("No events have been created")
        end
    end
end
```

When I ran the new test in RSpec it gave me an error.
```bash
rspec spec/features/event-tracker/listing_events_spec.rb 
FF

Failures:

  1) Event tracker - Listing events -  A user lists all events
     Failure/Error: expect(page).to have_content("1962-11-18")
       expected to find text "1962-11-18" in "Listing events\nKirk Hammet's birthday\nJames Hetfield's birthday\nLars Ulrich's birthday\nNew event | Event tracker | Home"
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
     <p><%= link_to "#{event.title}", event_path(event) %> <%= "#{event.year}-#{'%02i' %event.month}-#{'%02i' %event.day}" %></p>
    <% end %>
<% end %>


<br>

<%= link_to 'New event', new_event_path %> | <%= link_to "Event tracker", event_tracker_path %> | <%= link_to "Home", root_path %>```

This time the test passed.
```bash
rspec spec/features/event-tracker/listing_events_spec.rb 
..

Finished in 0.34937 seconds (files took 1.14 seconds to load)
2 examples, 0 failures
```




### Committed the changes ###
I confirmed that none of my tests failed before I committed the changes.
```bash
rspec spec/features/
.*..*....**.......***..

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


Finished in 1.44 seconds (files took 1.53 seconds to load)
23 examples, 0 failures, 7 pending
```

```bash
git status
git add -A
git commit -m "Event tracker - Implemented listing events"
git checkout event-tracker
git merge listing-events 
git push origin event-tracker
git branch -d listing-events 
```

----------
[<< Previous Chapter](../section_4_event_tracker_event/4_1_creating_an_event) | [Table Of Contents](../how_i_developed_this_rails_application.md) | [Next Chapter >>](../section_4_event_tracker_event/4_3_showing_an_event.md)