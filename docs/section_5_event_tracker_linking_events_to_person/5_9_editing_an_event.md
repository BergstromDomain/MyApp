# How I developed this Ruby on Rails application #


## Event tracker - Linking events to person ##


### Editing an event ###


### Updated spec with more expectations ###
Just like the with the previous specs, I added additional expectations to the editing an event spec. 
```bash
gedit spec/features/event-tracker/editing_an_event_spec.rb
```

```ruby
require "rails_helper"

RSpec.feature "Event tracker - Editing an event - " do

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
    
    scenario "A user updates an event without uploading a new image" do
        visit "/"
        click_link "Event tracker"
        click_link "Event"
        click_link "Formed Metallica"
        click_link "Edit event"
        
        fill_in "Title", with: "Metallica was created"
        fill_in "Details", with: "Lars and James created Metallica"
        fill_in "Day", with: "30"
        fill_in "Month", with: "10"
        fill_in "Year", with: "1981"
        click_button "Update the event"

        # Expected routing
        expect(current_path).to eq(person_event_path(@person2.id, @event3.id))

        # Expected navigation bar
        # TODO Add a proper navigation bar
        expect(page).to have_content("Navigation")
        expect(page).to have_link("Home")
        expect(page).to have_link("Event tracker") 

        # Expected page title
        # TODO Add title expectaion
        expect(page).to have_content("Lars Ulrich - Metallica was created")

        # Expected flash message
        expect(page).to have_content("The event was successfully updated to Metallica was created")

        # Expected content
        expect(page).to have_content("Lars and James created Metallica")
        expect(page).to have_content("1981-10-30")

        # Expected actions
        expect(page).to have_link("Edit event")
        expect(page).to have_link("Delete event")
        expect(page).to have_link("Back")
    end

    scenario "A user fails to update an event" do
        visit "/"
        click_link "Event tracker"
        click_link "People"
        click_link "Kirk Hammet"
        click_link "Birthday"
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

        # Expected content
        
        # Expected navigation

        # Expected path
        expect(current_path).to eq(event_path(@event2)) 
    end

    xscenario "A user updates an event including uploading a new image" do
   end

    xscenario "A user updates an event and removes the uploaded image" do
   end

end
```

When I ran the spec it gave me the first error.
```bash
rspec spec/features/event-tracker/editing_an_event_spec.rb 
FF**

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Editing an event -  A user updates an event including uploading a new image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/editing_an_event_spec.rb:101

  2) Event tracker - Editing an event -  A user updates an event and removes the uploaded image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/editing_an_event_spec.rb:104


Failures:

  1) Event tracker - Editing an event -  A user updates an event without uploading a new image
     Failure/Error: <%= link_to 'Show', @event %> | <%= link_to 'Back', events_path %>
     
     ActionView::Template::Error:
       undefined method `event_path' for #<ActionView::Base:0x00000000009588>
       Did you mean?  events_path
```


### Updated the events edit page ###
I updated the events edit page to include the navigation links.
```bash
gedit app/views/events/edit.html.erb
```

```ruby
<h2>Navigation</h2>
<%= link_to 'Home', root_path %>
<%= link_to 'Event tracker', people_path %> 
<br>


<h1>Editing <%= @person.first_name.titleize %> <%= @person.last_name.titleize %> - <%= @event.title.upcase_first %> </h1>
<br>


<h3>Flash message</h3>
<p id="notice"><%= notice %></p>
<br>


<%= render partial: 'form', :locals => {event: @event, :submit_button_label => 'Update the event'} %>

<h2>Actions</h2>
<%= link_to 'Cancel', people_path %>


<h3>Footer</h3>
Created by Nik at 2021-05-31 13:45
Last updated by Nik at 2021-06-01 09:00
```


When I ran the spec it gave me the next error.
```bash
rspec spec/features/event-tracker/editing_an_event_spec.rb 
FF**

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Editing an event -  A user updates an event including uploading a new image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/editing_an_event_spec.rb:101

  2) Event tracker - Editing an event -  A user updates an event and removes the uploaded image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/editing_an_event_spec.rb:104


Failures:

  1) Event tracker - Editing an event -  A user updates an event without uploading a new image
     Failure/Error: format.html { redirect_to @event, notice: "The event was successfully updated to #{@event.title.upcase_first}." }
     
     NoMethodError:
       undefined method `event_url' for #<EventsController:0x00000000009628>
       Did you mean?  events_url
```

### Updated the events controller ###
I updated the redirection in the events controller.
```bash
gedit app/controllers/events_controller.rb
```

```ruby
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to person_event_path(@person, @event), notice: "The event was successfully updated to #{@event.title.upcase_first}." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end
```


When I ran the spec it worked as expected.
```bash
rspec spec/features/event-tracker/editing_an_event_spec.rb 
..**

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Editing an event -  A user updates an event including uploading a new image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/editing_an_event_spec.rb:123

  2) Event tracker - Editing an event -  A user updates an event and removes the uploaded image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/editing_an_event_spec.rb:126


Finished in 0.76106 seconds (files took 3.02 seconds to load)
4 examples, 0 failures, 2 pending
```

### Committed the changes ###
This functionallity worked as expected and I just committed my changes.
```bash
git status
git add -A
git commit -m "Event tracker - Linked events to a person - Updated editing an event"
```

----------
[<< Previous Chapter](../section_5_linking_events_to_person/5_8_showing_an_event.md) | [Table Of Contents](../how_i_developed_this_rails_application.md) | [Next Chapter >>](../section_5_event_tracker_linking_events_to_person/5_10_deleting_an_event.md)
