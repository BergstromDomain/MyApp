# How I developed this Ruby on Rails application #


## Event tracker - Linking events to person ##


### Showing an event ###


### Updated spec with more expectations ###
Just like the with the previous specs, I added additional expectations to the creating an event spec. A user can reach the show event page either from the person's events or from the vents page so I ensured that both options were included in the spec.
```bash
gedit spec/features/event-tracker/showing_an_event_spec.rb
```


```ruby
require "rails_helper"

RSpec.feature "Event tracker - Showing an event - " do
    
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
                                
    scenario "A user selects an event from a person and shows it" do
        visit "/"
        click_link "Event tracker"
        click_link "People"
        click_link "Lars Ulrich"
        click_link "Birthday"
        
        # Expected routing
        expect(current_path).to eq(person_event_path(@person2.id, @event2.id))

        # Expected navigation bar
        # TODO Add a proper navigation bar
        expect(page).to have_content("Navigation")
        expect(page).to have_link("Home")
        expect(page).to have_link("Event tracker") 
        
        # Expected page title
        # TODO Add title expectaion
        expect(page).to have_content("Lars Ulrich - Birthday")
        
        # Expected flash message
        # TODO No flash message
        
        # Expected content
        expect(page).to have_content("Lars Ulrich was born on December 26, 1963")
        expect(page).to have_content("1963-12-26")

        # Expected navigation
        expect(page).to have_link("Edit event")
        expect(page).to have_link("Edit event")
        expect(page).to have_link("Back")
   end

    scenario "A user selects an event from the events listing and shows it" do
        visit "/"
        click_link "Event tracker"
        click_link "Event"
        click_link "Formed Metallica"
        
        # Expected routing
        expect(current_path).to eq(person_event_path(@person2, @event3))

        # Expected navigation bar
        # TODO Add a proper navigation bar
        expect(page).to have_content("Navigation")
        expect(page).to have_link("Home")
        expect(page).to have_link("Event tracker") 
        
        # Expected page title
        # TODO Add title expectaion
        expect(page).to have_content("Lars Ulrich - Formed Metallica")
        
        # Expected flash message
        # TODO No flash message
        
        # Expected content
        expect(page).to have_content("Lars and James formed Metallica")
        expect(page).to have_content("1981-10-01")

        # Expected navigation
        expect(page).to have_link("Edit event")
        expect(page).to have_link("Edit event")
        expect(page).to have_link("Back")
   end

    xscenario "A user shows an event with an uploaded image" do
    end
end
```

When I ran the spec it gave me the first error.
```bash
rspec spec/features/event-tracker/listing_events_spec.rb 
FF

Failures:

  1) Event tracker - Listing events -  A user lists all events
     Failure/Error: <p><%= link_to "#{event.title}", event_path(event) %> <%= "#{event.year}-#{'%02i' %event.month}-#{'%02i' %event.day}" %></p>
     
     ActionView::Template::Error:
       undefined method `event_path' for #<ActionView::Base:0x00000000009420>
       Did you mean?  events_path
```


### Updated the events show page ###
I updated the events show page to include the navigation links.
```bash
gedit app/views/events/show.html.erb
```

```ruby
<h2>Navigation</h2>
<%= link_to 'Home', root_path %>
<%= link_to 'Event tracker', people_path %> 
<br>


<h1><%= @person.first_name.titleize %> <%= @person.last_name.titleize %> - <%= @event.title.upcase_first %> </h1>


<h3>Flash message</h3>
<p id="notice"><%= notice %></p>. 
<br>


<h3>Details</h3>
<%= @event.details %>

<h3>Date</h3>
<%= @event.year.to_s + "-" + format('%02i', @event.month) + "-" + format('%02i', @event.day)%>


<h2>Actions</h2>
<%= link_to 'Edit event', edit_person_event_path(@person, @event) %> | 
<%= link_to 'Delete event', person_event_path(@person, @event), method: :delete, data: { confirm: "Are you sure you want to delete the person?" } %> | 
<%= link_to 'Back', person_path(@person) %>
<br>


<h3>Footer</h3>
Created by Nik at 2021-05-31 13:45
Last updated by Nik at 2021-06-01 09:00
```


When I ran the spec it worked as expected.
```bash
rspec spec/features/event-tracker/showing_an_event_spec.rb 
..*

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Showing an event -  A user shows an event with an uploaded image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/showing_an_event_spec.rb:99


Finished in 0.48174 seconds (files took 1.34 seconds to load)
3 examples, 0 failures, 1 pending
```


### Committed the changes ###
This functionallity worked as expected and I just committed my changes.
```bash
git status
git add -A
git commit -m "Event tracker - Linked events to a person - Updated showing an event"
```

----------
[<< Previous Chapter](../section_5_linking_events_to_person/5_7_listing_events.md) | [Table Of Contents](../how_i_developed_this_rails_application.md) | [Next Chapter >>](../section_5_event_tracker_linking_events_to_person/5_9_editing_an_event.md)
