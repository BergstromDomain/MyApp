# How I developed this Ruby on Rails application #


## Event tracker - Person ##


### Deleting a person ###


#### Created git branch ####
I started off by creating a new feature branch *deleting-person*. 
```bash
git checkout -b deleting-person
```

#### Created the spec ####
I created the spec.
```bash
gedit spec/features/event-tracker/deleting_a_person_spec.rb
```

```ruby
require "rails_helper"

RSpec.feature "Event tracker - Deleting a person - " do
    
    before do
        @person1 = Person.create(first_name: "kirk",
                                  last_name: "hammet") 
        @person2 = Person.create(first_name: "JAMES",
                                  last_name: "HETFIELD") 
        @person3 = Person.create(first_name: "Lars",
                                  last_name: "Ulrich") 
    end
    
    scenario "A user deletes a person" do
        visit "/"
        click_link "Event tracker"
        click_link "People"
        click_link "Kirk Hammet"
        click_link "Delete person"

        expect(page).to have_content("Person was successfully deleted")
        expect(page).not_to have_content("Kirk Hammet")
        expect(current_path).to eq(people_path) 
   end
end
```

When I ran the new test in RSpec it gave me an error.
```bash
rspec spec/features/event-tracker/deleting_a_person_spec.rb 
F

Failures:

  1) Event tracker - Deleting a person -  A user deletes a person
     Failure/Error: click_link "Delete the person"
     
     Capybara::ElementNotFound:
       Unable to find link "Delete the person"
```


#### Updated the show page ####
I updated the show page.
```bash
gedit app/views/people/show.html.erb
```

```ruby
<p id="notice"><%= notice %></p>

<h1><%= @person.first_name.titleize %> <%= @person.last_name.titleize %> </h1>


<%= link_to 'Edit person', edit_person_path(@person) %> | <%= link_to "Delete person", person_path(@person), method: :delete, data: { confirm: "Are you sure you want to delete the person?" } %> | <%= link_to 'Back', people_path %> | <%= link_to "Home", root_path %>
```

When I ran the new test in RSpec it gave me an error.
```bash
rspec spec/features/event-tracker/deleting_a_person_spec.rb 
F

Failures:

  1) Event tracker - Deleting a person -  A user deletes a person
     Failure/Error: expect(page).to have_content("Person was successfully deleted")
       expected to find text "Person was successfully deleted" in "Person was successfully destroyed.\nListing people\nJames Hetfield\nLars Ulrich\nNew person | Event tracker | Home"
```


#### Updated the controller ####
I updated the notice message in the controller.
```bash
gedit app/controllers/people_controller.rb
```

When I ran the new test in RSpec it worked as expected .
```bash
rspec spec/features/event-tracker/deleting_a_person_spec.rb 
.

Finished in 0.24981 seconds (files took 1.18 seconds to load)
1 example, 0 failures
```

### Committed the changes ###
I confirmed that none of my tests failed before I committed the changes.
```bash
rspec spec/features/
.*....**.....***..

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Creating a person -  A user creates a new person including uploading an image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/creating_person_spec.rb:18

  2) Event tracker - Editing a person -  A user updates a person including uploading a new image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/editing_a_person_spec.rb:47

  3) Event tracker - Editing a person -  A user updates a person and removes the uploaded image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/editing_a_person_spec.rb:50

  4) Event Tracker - Showing A Person -  A user shows a person with an uploaded image - Name entered in lowercase letters
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/showing_person_spec.rb:56

  5) Event Tracker - Showing A Person -  A user shows a person witht an uploaded image - Name entered in uppercase letters
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/showing_person_spec.rb:59

  6) Event Tracker - Showing A Person -  A user shows a person with an uploaded image - Name entered in capitalized letters
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/showing_person_spec.rb:62


Finished in 0.92743 seconds (files took 1.05 seconds to load)
18 examples, 0 failures, 6 pending
```

```bash
git status
git add -A
git commit -m "Event tracker - Implemented deleting a person"
git checkout event-tracker
git merge deleting-person 
git push origin event-tracker
git branch -d deleting-person
Deleted branch deleting-person (was 846239b).
```

----------
[<< Previous Chapter](../section_3_event_tracker_person/3_4_editing_a_person.md) | [Table Of Contents](../how_i_developed_this_rails_application.md) | Next Chapter >>
