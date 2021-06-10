# How I developed this Ruby on Rails application #


## Event tracker - Linking events to person ##


### Deleting a person ###


### Updated spec with more expectations ###
Just like the with the previous specs, I added additional expectations to the deleting a person spec.
```bash
gedit spec/features/event-tracker/deleting_a_person_spec.rb
```

```ruby
require "rails_helper"

RSpec.feature "Event tracker - Deleting a person - " do
    
    before do
        @person1 = Person.create(first_name: "Kirk",
                                  last_name: "Hammet") 
    end
    
    scenario "A user deletes a person" do
        visit "/"
        click_link "Event tracker"
        click_link "People"
        click_link "Kirk Hammet"
        click_link "Delete person"

        # Expected routing
        expect(current_path).to eq(people_path) 

        # Expected navigation bar
        # TODO Add a proper navigation bar
        expect(page).to have_content("Navigation")
        expect(page).to have_link("Home")
        expect(page).to have_link("Event tracker")

        # Expected page title
        # TODO Add title expectaion
        expect(page).to have_content("Listing people")

        # Expected flash message
        expect(page).to have_content("Kirk Hammet was successfully deleted")

        # Expected content
        # TODO Add header validation
        expect(page).not_to have_content("Kirk Hammet")

        # Expected actions
        expect(page).to have_link("New person")
   end
end
```

When I ran the spec it worked as expected.
```bash
rspec spec/features/event-tracker/deleting_a_person_spec.rb 
.

Finished in 0.49565 seconds (files took 1.32 seconds to load)
1 example, 0 failures
```


### Committed the changes ###
This functionallity worked as expected and I just committed my changes.
```bash
git status
git add -A
git commit -m "Event tracker - Linked events to a person - Updated deleting a person"
```

----------
[<< Previous Chapter](../section_5_linking_events_to_person/5_4_editing_a_person.md) | [Table Of Contents](../how_i_developed_this_rails_application.md) | [Next Chapter >>](../section_5_event_tracker_linking_events_to_person/5_6_creating_an_event.md)
