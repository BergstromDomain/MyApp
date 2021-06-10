# How I developed this Ruby on Rails application #


## Event tracker - Linking events to person ##


### Deleting an event ###


### Updated spec with more expectations ###
Just like the with the previous specs, I added additional expectations to the deleting an event spec.
```bash
gedit spec/features/event-tracker/deleting_an_event_spec.rb
```

```ruby
require "rails_helper"

RSpec.feature "Event tracker - Deleting an event - " do
    
    before do
        @person1 = Person.create(first_name: "Kirk",
                                  last_name: "Hammet") 
        @person2 = Person.create(first_name: "Lars",
                                  last_name: "Ulrich")
        @person3 = Person.create(first_name: "Robert",
                                  last_name: "Trujillo")
                                  

        @event1 = Event.create(title: "Birthday",
                                details: "Kirk Lee Hammett was born on November 18, 1962)",
                                day: "18",
                                month: "11",
                                year: "1962",
                                person_id: @person1.id)
        @event2 = Event.create(title: "Birthday",
                                details: "Lars Ulrich was born on December 26, 1963)",
                                day: "26",
                                month: "12",
                                year: "1963",
                                person_id: @person2.id)
        @event3 = Event.create(title: "Formed Metallica",
                                details: "Lars and James formed Metallica",
                                day: "1",
                                month: "10",
                                year: "1981",
                                person_id: @person2.id)
    end

    scenario "A user deletes an event" do
        visit "/"
        click_link "Event tracker"
        click_link "People"
        click_link "Lars Ulrich"
        click_link "Birthday"
        click_link "Delete event"

        # Expected routing
        expect(current_path).to eq(person_path(@person2))

        # Expected navigation bar
        # TODO Add a proper navigation bar
        expect(page).to have_content("Navigation")
        expect(page).to have_link("Home")
        expect(page).to have_link("Event tracker") 
        
        # Expected page title
        # TODO Add title expectaion
        expect(page).to have_content("Lars Ulrich")
        
        # Expected flash message
        expect(page).to have_content("Event was successfully deleted")
        
        # Expected content
        # TODO Add header validation
        expect(page).not_to have_content("Birthday")
        expect(page).to have_content("New event")

        # Expected actions
        expect(page).to have_link("Edit person")
        expect(page).to have_link("Delete person")
        expect(page).to have_link("Back")

        # Expected footer
        # TODO Create proper footer
        expect(page).to have_content("Created by Nik at 2021-05-31 13:45")
        expect(page).to have_content("Last updated by Nik at 2021-06-01 09:00")
   end
end
```

When I ran the spec it gave me the first error.
```bash
rspec spec/features/event-tracker/deleting_an_event_spec.rb 
F

Failures:

  1) Event tracker - Deleting an event -  A user deletes an event
     Failure/Error: expect(current_path).to eq(person_path(@person2))
     
       expected: "/people/687"
            got: "/events"
     
       (compared using ==)
     # ./spec/features/event-tracker/deleting_an_event_spec.rb:43:in `block (2 levels) in <top (required)>'

Finished in 0.43622 seconds (files took 1.03 seconds to load)
1 example, 1 failure

Failed examples:

rspec ./spec/features/event-tracker/deleting_an_event_spec.rb:34 # Event tracker - Deleting an event -  A user deletes an event
```

### Updated the events controller ###
To resolve this I updated the destroy action in the events controller.
```bash
gedit app/controllers/events_controller.rb
```

```ruby
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to person_path(@person), notice: "Event was successfully deleted." }
      format.json { head :no_content }
    end
  end
```

When I ran the spec it worked as expected.
```bash
rspec spec/features/event-tracker/deleting_an_event_spec.rb 
.

Finished in 0.47671 seconds (files took 1.08 seconds to load)
1 example, 0 failures
```


### Committed the changes ###
This functionallity worked as expected and I just committed my changes.
```bash
git status
git add -A
git commit -m "Event tracker - Linked events to a person - Updated deleting an event"
```

----------
[<< Previous Chapter](../section_5_linking_events_to_person/5_9_editing_an_event.md) | [Table Of Contents](../how_i_developed_this_rails_application.md) | [Next Chapter >>](../section_5_event_tracker_linking_events_to_person/5_11_refactoring.md)
