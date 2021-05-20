# How I developed this Ruby on Rails application #


## Event Tracker - Person ##


### Editing a person ###

#### Created git branch ####
I started off by creating a new feature branch *editing-person*. 
```bash
git checkout -b editing-person
```

#### Created the spec ####
I created the spec.
```bash
gedit spec/features/event-tracker/editing_a_person_spec.rb
```

```ruby
require "rails_helper"

RSpec.feature "Event tracker - Editing a person - " do

    before do
        @person1 = Person.create(first_name: "kirk",
                                  last_name: "hammet") 
        @person2 = Person.create(first_name: "JAMES",
                                  last_name: "HETFIELD") 
        @person3 = Person.create(first_name: "Lars",
                                  last_name: "Ulrich") 
    end

    scenario "A user updates a person without uploading a new image" do
        visit "/"
        click_link "Event tracker"
        click_link "People"
        click_link "Kirk Hammet"
        click_link "Edit person"

        fill_in "First name", with: "Rober"
        fill_in "Last name", with: "Trujillo"
        click_button "Update the person"

        expect(page).to have_content("Person was successfully updated")
        expect(current_path).to eq(person_path(@person1)) 
    end

    scenario "A user fails to update a person" do
        visit "/"
        click_link "Event tracker"
        click_link "People"
        click_link "James Hetfield"
        click_link "Edit person"

        fill_in "First name", with: ""
        fill_in "Last name", with: ""
        click_button "Update the person"

        expect(page).to have_content("2 errors prohibited this person from being saved:")
        expect(page).to have_content("First name can't be blank")
        expect(page).to have_content("Last name can't be blank")

        expect(current_path).to eq(person_path(@person2)) 
    end

    xscenario "A user updates a person including uploading a new image" do
   end

    xscenario "A user updates a person and removes the uploaded image" do
   end
end
```

When I ran the new test in RSpec it gave me an error.
```bash
rspec spec/features/event-tracker/editing_a_person_spec.rb 
FF**

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Editing a person -  A user updates a person including uploading a new image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/editing_a_person_spec.rb:47

  2) Event tracker - Editing a person -  A user updates a person and removes the uploaded image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/editing_a_person_spec.rb:50


Failures:

  1) Event tracker - Editing a person -  A user updates a person without uploading a new image
     Failure/Error: click_button "Update the person"
     
     Capybara::ElementNotFound:
       Unable to find button "Update the person" that is not disabled
```

#### Updated the partial call ####
I updated the rendering of the partial to include a parameter for the button label.
```bash
gedit app/views/people/new.html.erb
```

```ruby
<h1>New person</h1>

<%= render partial: 'form', :locals => {person: @person, :button_label => 'Create a person'} %>

<%= link_to 'Back', people_path %>
```

```bash
gedit app/views/people/edit.html.erb
```

```ruby
<h1>Editing person</h1>

<%= render partial: 'form', :locals => {person: @person, :button_label => 'Update the person'} %>

<%= link_to 'Show', @person %> | <%= link_to 'Back', people_path %>
```

Finally I updated the partial to use the label name that I passed in with the call.
I updated the rendering of the partial to include a parameter for the button label.
```bash
gedit app/views/people/_form.html.erb
```

```ruby
<%= form_with(model: person) do |form| %>
  <% if person.errors.any? %>
    <div id="error_explanation">
      <h2><%= pluralize(person.errors.count, "error") %> prohibited this person from being saved:</h2>

      <ul>
        <% person.errors.each do |error| %>
          <li><%= error.full_message %></li>
        <% end %>
      </ul>
    </div>
  <% end %>

  <div class="field">
    <%= form.label :first_name %>
    <%= form.text_field :first_name %>
  </div>

  <div class="field">
    <%= form.label :last_name %>
    <%= form.text_field :last_name %>
  </div>

  <div class="field">
    <%= form.label :main_image %>
    <%= form.text_area :main_image %>
  </div>

  <div class="field">
    <%= form.label :thumb_image %>
    <%= form.text_area :thumb_image %>
  </div>

  <div class="actions">
    <%= form.submit button_label %>
  </div>
<% end %>
```

When I ran the new test in RSpec it worked as expected .
```bash
rspec spec/features/event-tracker/editing_a_person_spec.rb 
..**

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Editing a person -  A user updates a person including uploading a new image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/editing_a_person_spec.rb:47

  2) Event tracker - Editing a person -  A user updates a person and removes the uploaded image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/editing_a_person_spec.rb:50


Finished in 0.49458 seconds (files took 1.49 seconds to load)
4 examples, 0 failures, 2 pending
```

### Committed the changes ###
I confirmed that none of my tests failed before I committed the changes.
```bash
rspec spec/features/
.*...**.....***..

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


Finished in 0.93704 seconds (files took 1.16 seconds to load)
17 examples, 0 failures, 6 pending
```

```bash
git status
git add -A
git commit -m "Event tracker - Implemented editing a person"
git checkout event-tracker
git merge editing-person 
git push origin event-tracker
git branch -d editing-perosn 
```

----------
[<< Previous Chapter](../section_3_event_tracker_person/3_3_showing_a_person) | [Table Of Contents](../how_i_developed_this_rails_application.md) | [Next Chapter >>](../section_3_event_tracker_person/3_5_deleting_a_person.md)