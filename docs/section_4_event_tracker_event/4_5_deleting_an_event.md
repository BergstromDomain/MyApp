# How I developed this Ruby on Rails application #


## Event tracker - Event ##


### Deleting an event ###


#### Created git branch ####
I started off by creating a new feature branch *deleting-event*. 
```bash
git checkout -b deleting-event
```

#### Created the spec ####
I created the spec.
```bash
gedit spec/features/event-tracker/deleting_an_event_spec.rb
```

```ruby
require "rails_helper"

RSpec.feature "Event tracker - Deleting an event - " do
    
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

    scenario "A user deletes an event" do
        visit "/"
        click_link "Event tracker"
        click_link "Events"
        click_link "Kirk Hammet's birthday"
        click_link "Delete event"

        # Expected flash message
        expect(page).to have_content("Event was successfully deleted")

        # Expected content
        expect(page).not_to have_content("Kirk Hammet's birthday")

        # Expected path
        expect(current_path).to eq(events_path) 
   end
end
```

When I ran the new test in RSpec it gave me an error.
```bash
rspec spec/features/event-tracker/deleting_an_event_spec.rb 
F

Failures:

  1) Event tracker - Deleting an event -  A user deletes an event
     Failure/Error: expect(page).to have_content("Event was successfully deleted")
       expected to find text "Event was successfully deleted" in "Event was successfully destroyed.\nListing events\nJames Hetfield's birthday 1963-08-03\nLars Ulrich's birthday 1963-12-26\nNew event | Event tracker | Home"
       ```


#### Updated the controller ####
I updated the notice message in the controller.
```bash
gedit app/controllers/events_controller.rb
```

When I ran the new test in RSpec it worked as expected .
```bash
rspec spec/features/event-tracker/deleting_an_event_spec.rb 
.

Finished in 0.39773 seconds (files took 1.28 seconds to load)
1 example, 0 failures
```

### Committed the changes ###
I confirmed that none of my tests failed before I committed the changes.
```bash
rspec spec/features/
.*..*.....**..**.......***.*..

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


Finished in 1.77 seconds (files took 1.1 seconds to load)
30 examples, 0 failures, 10 pending
```

```bash
git status
git add -A
git commit -m "Event tracker - Implemented deleting an event"
git checkout event-tracker
git merge deleting-event
git push origin event-tracker
git branch -d deleting-event
```

----------
[<< Previous Chapter](../section_3_event_tracker_person/3_4_editing_a_person.md) | [Table Of Contents](../how_i_developed_this_rails_application.md) | Next Chapter >>
