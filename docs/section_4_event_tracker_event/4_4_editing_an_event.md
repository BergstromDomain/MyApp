# How I developed this Ruby on Rails application #


## Event tracker - Event ##


### Editing an event ###


#### Created git branch ####
I started off by creating a new feature branch *editing-event*. 
```bash
git checkout -b editing-event
```

#### Created the spec ####
I created the spec.
```bash
gedit spec/features/event-tracker/editing_an_event_spec.rb
```

```ruby
require "rails_helper"

RSpec.feature "Event tracker - Editing an event - " do

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

    scenario "A user updates an event without uploading a new image" do
        visit "/"
        click_link "Event tracker"
        click_link "Events"
        click_link "Kirk Hammet's birthday"
        click_link "Edit event"

        fill_in "Title", with: "Robert Trujillo's birthday"
        fill_in "Details", with: "Robert Trujillo's was born on October 23, 1964"
        fill_in "Day", with: "23"
        fill_in "Month", with: "10"
        fill_in "Year", with: "1964"

        click_button "Update the event"

        # Expected flash message
        expect(page).to have_content("Event was successfully updated")

        # Expected path
        expect(current_path).to eq(event_path(@event1)) 
    end

    scenario "A user fails to update an event" do
        visit "/"
        click_link "Event tracker"
        click_link "Events"
        click_link "James Hetfield's birthday"
        click_link "Edit event"

        fill_in "Title", with: ""
        fill_in "Details", with: ""
        fill_in "Day", with: ""
        fill_in "Month", with: ""
        fill_in "Year", with: ""

        click_button "Update the event"

        # Expected flash message
        expect(page).to have_content("1 error prohibited this event from being saved:")
        expect(page).to have_content("Title can't be blank")

        # Expected path
        expect(current_path).to eq(event_path(@event2)) 
    end

    xscenario "A user updates an event including uploading a new image" do
   end

    xscenario "A user updates an event and removes the uploaded image" do
   end

end
```

When I ran the new test in RSpec it gave me an error.
```bash
rspec spec/features/event-tracker/editing_an_event_spec.rb 
FF**

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Editing an event -  A user updates an event including uploading a new image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/editing_an_event_spec.rb:68

  2) Event tracker - Editing an event -  A user updates an event and removes the uploaded image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/editing_an_event_spec.rb:71


Failures:

  1) Event tracker - Editing an event -  A user updates an event without uploading a new image
     Failure/Error: <%= form.submit submit_button_label %>
     
     ActionView::Template::Error:
       undefined local variable or method `submit_button_label' for #<ActionView::Base:0x00000000009498>
```

#### Updated the partial call ####
I updated the rendering of the partial to include a parameter for the button label.
```bash
gedit app/views/events/edit.html.erb
```

```ruby
<h1>Editing event</h1>

<%= render partial: 'form', :locals => {event: @event, :submit_button_label => 'Update the event'} %>

<%= link_to 'Show', @event %> | <%= link_to 'Back', events_path %>
```

When I ran the new test in RSpec it worked as expected .
```bash
rspec spec/features/event-tracker/editing_an_event_spec.rb 
..**

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Editing an event -  A user updates an event including uploading a new image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/editing_an_event_spec.rb:68

  2) Event tracker - Editing an event -  A user updates an event and removes the uploaded image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/editing_an_event_spec.rb:71


Finished in 0.46669 seconds (files took 1.48 seconds to load)
4 examples, 0 failures, 2 pending
```

### Committed the changes ###
I confirmed that none of my tests failed before I committed the changes.
```bash
rspec spec/features/
.*..*....**..**.......***.*..

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Creating a person -  A user creates a new person including uploading an image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/creating_a_person_spec.rb:18

  2) Event tracker - Creating an event -  A user creates a new event including uploading an image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/creating_an_event_spec.rb:21

  3) Event tracker - Editing a person -  A user updates a person including uploading a new image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/editing_a_person_spec.rb:52

  4) Event tracker - Editing a person -  A user updates a person and removes the uploaded image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/editing_a_person_spec.rb:55

  5) Event tracker - Editing an event -  A user updates an event including uploading a new image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/editing_an_event_spec.rb:68

  6) Event tracker - Editing an event -  A user updates an event and removes the uploaded image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/editing_an_event_spec.rb:71

  7) Event Tracker - Showing A Person -  A user shows a person with an uploaded image - Name entered in lowercase letters
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/showing_a_person_spec.rb:57

  8) Event Tracker - Showing A Person -  A user shows a person witht an uploaded image - Name entered in uppercase letters
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/showing_a_person_spec.rb:60

  9) Event Tracker - Showing A Person -  A user shows a person with an uploaded image - Name entered in capitalized letters
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/showing_a_person_spec.rb:63

  10) Event tracker - Showing an event -  A user shows an event with an uploaded image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/showing_an_event_spec.rb:43


Finished in 1.52 seconds (files took 1.29 seconds to load)
29 examples, 0 failures, 10 pending
```

```bash
git status
git add -A
git commit -m "Event tracker - Implemented editing an event"
git checkout event-tracker
git merge editing-event
git push origin event-tracker
git branch -d editing-event
```

----------
[<< Previous Chapter](../section_4_event_tracker_event/4_3_showing_an_event) | [Table Of Contents](../how_i_developed_this_rails_application.md) | [Next Chapter >>](../section_4_event_tracker_event/4_5_deleting_an_event.md)