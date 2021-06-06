# How I developed this Ruby on Rails application #


## Event tracker - Linking events to person ##


### Listing events ###


### Updated spec with more expectations ###
Just like the with the previous specs, I added additional expectations to the creating an event spec.
```bash
gedit spec/features/event-tracker/listing_events_spec.rb
```


```ruby
require "rails_helper"

RSpec.feature "Event tracker - Listing events - " do
    
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
                                details: "Lars and James formed Metallica)",
                                day: "",
                                month: "",
                                year: "1981",
                                person_id: @person2.id)
    end


    scenario "A user lists all events" do
        visit "/"
        click_link "Event tracker"
        click_link "Events"

        # Expected routing
        expect(current_path).to eq(events_path)   

        # Expected navigation bar
        # TODO Add a proper navigation bar
        expect(page).to have_content("Navigation")
        expect(page).to have_link("Home")
        expect(page).to have_link("Event tracker")        

        # Expected page title
        # TODO Add title expectaion
        expect(page).to have_content("Listing events")
        
        # Expected flash message
        # TODO No flash message

        # Expected content
        expect(page).to have_link("Kirk Hammet")
        expect(page).to have_link("Birthday")
        expect(page).to have_content("1962-11-18")

        expect(page).to have_link("Lars Ulrich")
        expect(page).to have_link("Birthday")
        expect(page).to have_content("1963-12-26")

        expect(page).to have_link("Lars Ulrich")
        expect(page).to have_link("Formed Metallica")
        expect(page).to have_content("1981-10-01")
        
        expect(page).not_to have_content("Robert Trujillo")

        # Expected actions
        # TODO New event (add person from drop down)
   end

    scenario "A user tries to lists all events but there are none" do
       Event.delete_all
        visit "/"
        click_link "Event tracker"
        click_link "Events"

        # Expected routing
        expect(current_path).to eq(events_path)   

        # Expected navigation bar
        # TODO Add a proper navigation bar
        expect(page).to have_content("Navigation")
        expect(page).to have_link("Home")
        expect(page).to have_link("Event tracker")        

        # Expected page title
        # TODO Add title expectaion
        expect(page).to have_content("Listing events")
        
        # Expected flash message
        # TODO No flash message

        # Expected content
        expect(page).not_to have_link("Kirk Hammet")
        expect(page).not_to have_link("Birthday")
        expect(page).not_to have_content("1962-11-18")

        expect(page).not_to have_link("Lars Ulrich")
        expect(page).not_to have_link("Birthday")
        expect(page).not_to have_content("1963-12-26")

        expect(page).not_to have_link("Lars Ulrich")
        expect(page).not_to have_link("Formed Metallica")
        expect(page).not_to have_content("1981-10-01")

        within ("h1#no-events") do
            expect(page).to have_content("No events have been created")
        end

        # Expected actions
        # TODO New event (add person from drop down)
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




### Updated the events index page ###
I updated the events index page to include the navigation links as well as the new nested routes.
```bash
gedit app/views/events/index.html.erb
```

```ruby
<h2>Navigation</h2>
<%= link_to 'Home', root_path %>
<%= link_to 'Event tracker', people_path %> 
<br>


<h1>Listing events</h1>


<h3>Flash message</h3>
<p id="notice"><%= notice %></p>
<br>


<% if @events.empty? %>
    <h1 id="no-events">No events have been created</h1>
<% else %>
    <% @events.each do |event| %>
    <p><%= link_to "#{event.person.first_name.titleize} #{event.person.last_name.titleize}", person_path(event.person_id) %> - <%= link_to "#{event.title}", person_event_path(event.person_id, event.id) %> <%= "#{event.year}-#{'%02i' %event.month}-#{'%02i' %event.day}" %> </p>
    <% end %>
<% end %>


<h3>Footer</h3>
Created by Nik at 2021-05-31 13:45
Last updated by Nik at 2021-06-01 09:00
```

When I ran the spec it gave me the next error.
```bash
rspec spec/features/event-tracker/listing_events_spec.rb 
F.

Failures:

  1) Event tracker - Listing events -  A user lists all events
     Failure/Error: <p><%= link_to "#{event.person.first_name.titleize} #{event.person.last_name.titleize}", person_path(event.person_id) %> - <%= link_to "#{event.title}", person_event_path(event.person_id, event.id) %> <%= "#{event.year}-#{'%02i' %event.month}-#{'%02i' %event.day}" %> </p>
     
     ActionView::Template::Error:
       can't convert nil into Integer
```

### Updated the event model ###
I decided to change the behaviour of events, making dates mandatory. To do that I added validations in the model. I also update the spec to include dates on all my events.
```bash
gedit app/models/event.rb
```

```ruby
class Event < ApplicationRecord
    validates :title, :year, :month, :day, presence: true
    
    belongs_to :person
end
```

When I ran the spec it worked as expected.
```bash
rspec spec/features/event-tracker/listing_events_spec.rb 
..

Finished in 0.47712 seconds (files took 1.03 seconds to load)
2 examples, 0 failures
```


### Committed the changes ###
This functionallity worked as expected and I just committed my changes.
```bash
git status
git add -A
git commit -m "Event tracker - Linked events to a person - Updated listing events"
```

----------
[<< Previous Chapter](../section_5_linking_events_to_person/5_6_creating_an_event.md) | [Table Of Contents](../how_i_developed_this_rails_application.md) | [Next Chapter >>](../section_5_event_tracker_linking_events_to_person/5_8_showing_an_event.md)
