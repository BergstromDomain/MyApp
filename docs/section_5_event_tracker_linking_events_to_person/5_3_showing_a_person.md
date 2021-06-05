# How I developed this Ruby on Rails application #


## Event tracker - Linking events to person ##


### Showing a person ###


### Updated spec with more expectations ###
Just like the with the previous specs, I added additional expectations to the showing person spec.
```bash
gedit spec/features/event-tracker/showing_a_person_spec.rb
```

```ruby
require "rails_helper"

RSpec.feature "Event Tracker - Showing a person - " do
    
    before do
        @person1 = Person.create(first_name: "kirk",
                                  last_name: "hammet") 
        @person2 = Person.create(first_name: "JAMES",
                                  last_name: "HETFIELD") 
        @person3 = Person.create(first_name: "Lars",
                                  last_name: "Ulrich")

        @event1 = Event.create(title: "James Hetfield's birthday",
                                details: "James Alan Hetfield was born on August 3, 1963)",
                                day: "3",
                                month: "8",
                                year: "1963",
                                person_id: @person2.id)
        @event2 = Event.create(title: "Lars Ulrich's birthday",
                                details: "Lars Ulrich was born on December 26, 1963)",
                                day: "26",
                                month: "12",
                                year: "1963",
                                person_id: @person3.id)
        @event3 = Event.create(title: "Formed Metallica",
                                details: "Lars and James formed Metallica)",
                                day: "1",
                                month: "10",
                                year: "1981",
                                person_id: @person3.id)
    end
    
    scenario "A user shows a person without any events" do
        visit "/"
        click_link "Event tracker"
        click_link "People"
        click_link "Kirk Hammet"

        # Expected routing
        expect(current_path).to eq(person_path(@person1))

        # Expected navigation bar
        # TODO Add a proper navigation bar
        expect(page).to have_content("Navigation")
        expect(page).to have_link("Home")
        expect(page).to have_link("Event tracker")

        # Expected page title
        # TODO Add title expectaion
        expect(page).to have_content("Kirk Hammet")

        # Expected flash message
        # TODO Do not expect any flash messages
        
        # Expected page content
        # TODO Add header expectaion
        expect(page).to have_content("Events")
        expect(page).to have_content("Kirk does not have any events")

        expect(page).to have_link("New event")

        # Expected actions
        expect(page).to have_link("Edit person")
        expect(page).to have_link("Delete person")
        expect(page).to have_link("Back")

        # Expected footer
        # TODO Create proper footer
        expect(page).to have_content("Created by Nik at 2021-05-31 13:45")
        expect(page).to have_content("Last updated by Nik at 2021-06-01 09:00")
    end
    
    scenario "A user shows a person with one event" do
        visit "/"
        click_link "Event tracker"
        click_link "People"
        click_link "James Hetfield"

        # Expected routing
        expect(current_path).to eq(person_path(@person2))

        # Expected navigation bar
        # TODO Add a proper navigation bar
        expect(page).to have_content("Navigation")
        expect(page).to have_link("Home")
        expect(page).to have_link("Event tracker")

        # Expected page title
        # TODO Add title expectaion
        expect(page).to have_content("James Hetfield")

        # Expected flash message
        # TODO Do not expect any flash messages
        
        # Expected page content
        # TODO Add header expectaion
        expect(page).to have_content("Events")
        expect(page).to have_content("James Hetfield's birthday")
        expect(page).to have_content("1963-08-03")
        expect(page).to have_link("New event")

        # Expected actions
        expect(page).to have_link("Edit person")
        expect(page).to have_link("Delete person")
        expect(page).to have_link("Back")

        # Expected footer
        # TODO Create proper footer
        expect(page).to have_content("Created by Nik at 2021-05-31 13:45")
        expect(page).to have_content("Last updated by Nik at 2021-06-01 09:00")
    end

    scenario "A user shows a person with multiple events" do
        visit "/"
        click_link "Event tracker"
        click_link "People"
        click_link "Lars Ulrich"

        # Expected routing
        expect(current_path).to eq(person_path(@person3))

        # Expected navigation bar
        # TODO Add a proper navigation bar
        expect(page).to have_content("Navigation")
        expect(page).to have_link("Home")
        expect(page).to have_link("Event tracker")

        # Expected page title
        # TODO Add title expectaion
        expect(page).to have_content("Lars Ulrich")

        # Expected flash message
        # TODO Do not expect any flash messages
        
        # Expected page content
        # TODO Add header expectaion
        expect(page).to have_content("Events")
        expect(page).to have_content("Lars Ulrich's birthday")
        expect(page).to have_content("1963-12-26")
        expect(page).to have_content("Formed Metallica")
        expect(page).to have_content("1981-10-01")
        expect(page).to have_link("New event")

        # Expected actions
        expect(page).to have_link("Edit person")
        expect(page).to have_link("Delete person")
        expect(page).to have_link("Back")

        # Expected footer
        # TODO Create proper footer
        expect(page).to have_content("Created by Nik at 2021-05-31 13:45")
        expect(page).to have_content("Last updated by Nik at 2021-06-01 09:00")
    end

    scenario "A user shows a person - Name entered in lowercase letters" do
        visit "/"
        click_link "Event tracker"
        click_link "People"
        click_link "Kirk Hammet"

        # Expected routing
        expect(current_path).to eq(person_path(@person1))

        # Expected page title
        # TODO Add title expectaion
        expect(page).to have_content("Kirk Hammet")
   end
   
    scenario "A user shows a person - Name entered in uppercase letters" do
        visit "/"
        click_link "Event tracker"
        click_link "People"
        click_link "James Hetfield"

        # Expected routing
        expect(current_path).to eq(person_path(@person2))

        # Expected page title
        # TODO Add title expectaion
        expect(page).to have_content("James Hetfield")
   end

    scenario "A user shows a person - Name entered in capitalized letters" do
        visit "/"
        click_link "Event tracker"
        click_link "People"
        click_link "Lars Ulrich"

        # Expected routing
        expect(current_path).to eq(person_path(@person3))

        # Expected page title
        # TODO Add title expectaion
        expect(page).to have_content("Lars Ulrich")
   end

    xscenario "A user shows a person without an uploaded image" do
    end

    xscenario "A user shows a person with an uploaded image" do
    end
end
```

When I ran the spec it gave me the first error.
```bash
rspec spec/features/event-tracker/showing_a_person_spec.rb 
.FF...**

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event Tracker - Showing a person -  A user shows a person without an uploaded image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/showing_a_person_spec.rb:197

  2) Event Tracker - Showing a person -  A user shows a person with an uploaded image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/showing_a_person_spec.rb:200


Failures:

  1) Event Tracker - Showing a person -  A user shows a person with one event
     Failure/Error: expect(page).to have_content("James Hetfield's birthday")
       expected to find text "James Hetfield's birthday" in "Navigation\nHome Event tracker\nJames Hetfield\nFlash message\nEvents\nNew event\nActions\nEdit person | Delete person | Back\nFooter\nCreated by Nik at 2021-05-31 13:45 Last updated by Nik at 2021-06-01 09:00"
```


### Updated persons show page ###
I updated the persons show page and looped through the events for that person.
```bash
gedit app/views/people/show.html.erb
```

```ruby
<h2>Navigation</h2>
<%= link_to 'Home', root_path %>
<%= link_to 'Event tracker', people_path %> 
<br>


<h1><%= @person.first_name.titleize %> <%= @person.last_name.titleize %> </h1>


<h3>Flash message</h3>
<p id="notice"><%= notice %></p>
<br>


<h2>Events</h2>
<% if @person.events.empty? %>
    <h4 id="no-events"><%= @person.first_name.titleize %> does not have any events</h4>
<% else %>
    <% @person.events.each do |event| %>
     <p><%= link_to "#{event.title}", person_events_path(@person, event) %> <%= event.year.to_s + "-" + format('%02i', event.month) + "-" + format('%02i', event.day)%></p>
    <% end %>    
<% end %>
<br>
<%= link_to 'New event', new_person_event_path(@person) %> 
<br>


<h2>Actions</h2>
<%= link_to 'Edit person', edit_person_path(@person) %> | 
<%= link_to 'Delete person', person_path(@person), method: :delete, data: { confirm: "Are you sure you want to delete the person?" } %> | 
<%= link_to 'Back', people_path %>
<br>


<h3>Footer</h3>
Created by Nik at 2021-05-31 13:45
Last updated by Nik at 2021-06-01 09:00
```

When I ran the spec it worked as expected.
```bash
rspec spec/features/event-tracker/showing_a_person_spec.rb 
......**

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event Tracker - Showing a person -  A user shows a person without an uploaded image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/showing_a_person_spec.rb:197

  2) Event Tracker - Showing a person -  A user shows a person with an uploaded image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/showing_a_person_spec.rb:200


Finished in 0.69857 seconds (files took 0.83962 seconds to load)
8 examples, 0 failures, 2 pending
```


### Committed the changes ###
This functionallity worked as expected and I just committed my changes.
```bash
git status
git add -A
git commit -m "Event tracker - Linked events to a person - Updated showing a person"
```

----------
[<< Previous Chapter](../section_5_linking_events_to_person/5_0_event_tracker_linking_events_to_person_toc.md) | [Table Of Contents](../how_i_developed_this_rails_application.md) | [Next Chapter >>](../section_5_event_tracker_linking_events_to_person/5_2_listing_people.md)
