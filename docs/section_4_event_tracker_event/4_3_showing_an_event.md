# How I developed this Ruby on Rails application #


## Event tracker - Event ##


### Showing an event ###


#### Created git branch ####
I started off by creating a new feature branch *showing-event*. 
```bash
git checkout -b showing-event
```

#### Created the spec ####
I created the spec.
```bash
gedit spec/features/event-tracker/showing_an_event_spec.rb
```

```ruby
require "rails_helper"

RSpec.feature "Event tracker - Showing an event - " do
    
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

    scenario "A user shows an event without an uploaded image" do
        visit "/"
        click_link "Event tracker"
        click_link "Event"
        click_link "James Hetfield's birthday"
        
        # Expected content
        expect(page).to have_content("James Hetfield's birthday")
        expect(page).to have_content("James Alan Hetfield was born on August 3, 1963")
        expect(page).to have_content("1963-08-03")

        # Expected navigation
        expect(page).to have_link("Edit event")
        expect(page).to have_link("Back")
        expect(page).to have_link("Home")

        # Expected path
        expect(current_path).to eq(event_path(@event2))
   end

    xscenario "A user shows an event with an uploaded image" do
    end

end
```

When I ran the new test in RSpec it gave me an error.
```bash
rspec spec/features/event-tracker/showing_an_event_spec.rb 
F*

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Showing an event -  A user shows an event with an uploaded image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/showing_an_event_spec.rb:43


Failures:

  1) Event tracker - Showing an event -  A user shows an event without an uploaded image
     Failure/Error: expect(page).to have_content("1962-11-18")
       expected to find text "1962-11-18" in "Title: Kirk Hammet's birthday\nDetails: Kirk Lee Hammett was born on November 18, 1962\nDay: 18\nMonth: 11\nYear: 1962\nMain image:\nThumb image:\nEdit | Back"
```
       
  
### Updated the show page ###
I updated the show page.
```bash
gedit app/views/events/show.html.erb
```
     
```ruby
<p id="notice"><%= notice %></p>

<h1><%= @event.title %> </h1>

<p>
  <strong>Details:</strong>
  <%= @event.details %>
</p>

<p>
  <strong>Date:</strong>
  <%= @event.year.to_s + "-" + format('%02i', @event.month) + "-" + format('%02i', @event.day)%>
</p>


<%= link_to 'Edit event', edit_event_path(@event) %> | <%= link_to "Delete event", event_path(@event), method: :delete, data: { confirm: "Are you sure you want to delete the event?" } %> | <%= link_to 'Back', events_path %> | <%= link_to "Home", root_path %>
```

I added padding for both the month and the day so that the date will be displayed as *yyyy-mm-dd*. Later on I plan to add drop down lists and data validation but this will do for now.

When I ran the new test in RSpec it worked as expected .
```bash
rspec spec/features/event-tracker/showing_an_event_spec.rb 
.*

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Showing an event -  A user shows an event with an uploaded image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/showing_an_event_spec.rb:43


Finished in 0.26884 seconds (files took 1.52 seconds to load)
2 examples, 0 failures, 1 pending
```

### Committed the changes ###
I confirmed that none of my tests failed before I committed the changes.
```bash
rspec spec/features/
.*..*....**.......***.*..

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

  8) Event tracker - Showing an event -  A user shows an event with an uploaded image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/showing_an_event_spec.rb:43


Finished in 1.74 seconds (files took 1.5 seconds to load)
25 examples, 0 failures, 8 pending
```

```bash
git status
git add -A
git commit -m "Event tracker - Implemented showing an event"
git checkout event-tracker
git merge showing-event
git push origin event-tracker
git branch -d showing-event
```



----------
[<< Previous Chapter](../section_4_event_tracker_person/4_2_listing_events) | [Table Of Contents](../how_i_developed_this_rails_application.md) | [Next Chapter >>](../section_4_event_tracker_event/4_4_editing_an_event.md)
