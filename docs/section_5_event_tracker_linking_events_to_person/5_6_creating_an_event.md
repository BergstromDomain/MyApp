# How I developed this Ruby on Rails application #


## Event tracker - Linking events to person ##


### Creating an event ###


### Updated spec with more expectations ###
Just like the with the previous specs, I added additional expectations to the creating an event spec.
```bash
gedit spec/features/event-tracker/creating_an_event_spec.rb
```


```ruby
require "rails_helper"

RSpec.feature "Event tracker - Creating an event - " do
    before do
        @person1 = Person.create(first_name: "Kirk",
                                  last_name: "Hammet") 
    end    
    
    scenario "A user creates a new event without uploading an image" do
        visit "/"
        click_link "Event tracker"
        click_link "People"
        click_link "Kirk Hammet"
        click_link "New event"

        fill_in "Title", with: "Birthday"
        fill_in "Details", with: "Kirk Lee Hammett was born on November 18, 1962"
        fill_in "Day", with: "18"
        fill_in "Month", with: "11"
        fill_in "Year", with: "1962"
        click_button "Create an event"

        # Expected routing
        expect(current_path).to eq(person_event_path(@person1.id, Event.last.id))         

        # Expected navigation bar
        # TODO Add a proper navigation bar
        expect(page).to have_content("Navigation")
        expect(page).to have_link("Home")
        expect(page).to have_link("Event tracker")

        # Expected page title
        # TODO Add title expectaion
        expect(page).to have_content("Kirk Hammet - Birthday")

        # Expected flash message
        expect(page).to have_content("Flash message")
        expect(page).to have_content("Birthday was successfully created")

        # Expected page content
        # TODO Add header expectaion
        expect(page).to have_content("Kirk Lee Hammett was born on November 18, 1962")
        expect(page).to have_content("1962-11-18")

        # Expected actions
        expect(page).to have_link("Edit event")
        expect(page).to have_link("Delete event")
        expect(page).to have_link("Back")
    end

    scenario "A user fails to create a new event" do
        visit "/"
        click_link "Event tracker"
        click_link "People"
        click_link "Kirk Hammet"
        click_link "New event"

        fill_in "Title", with: ""
        fill_in "Details", with: ""
        fill_in "Day", with: ""
        fill_in "Month", with: ""
        fill_in "Year", with: ""
        click_button "Create an event"

        # Expected routing
        expect(current_path).to eq(person_events_path(@person1))         

        # Expected navigation bar
        # TODO Add a proper navigation bar
        expect(page).to have_content("Navigation")
        expect(page).to have_link("Home")
        expect(page).to have_link("Event tracker")

        # Expected page title
        # TODO Add title expectaion
        expect(page).to have_content("Kirk Hammet - New event")

        # Expected flash message
        expect(page).to have_content("Flash message")
        expect(page).to have_content("1 error prohibited this event from being saved:")
        expect(page).to have_content("Title can't be blank")

        # Expected page content
        # TODO Add header expectaion
        expect(page).to have_content("Title")
        expect(page).to have_content("Details")
        expect(page).to have_content("Day")
        expect(page).to have_content("Month")
        expect(page).to have_content("Year")
        expect(page).to have_content("Main image")
        expect(page).not_to have_content("Thumb image")
        
        # Expected actions
        expect(page).to have_selector("input[type=submit][value='Create an event']")
        expect(page).to have_link("Cancel")
    end

    xscenario "A user creates a new event including uploading an image" do
   end
end
```

When I ran the spec it gave me the first error.
```bash
rspec spec/features/event-tracker/creating_an_event_spec.rb 
F*F

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Creating an event -  A user creates a new event including uploading an image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/creating_an_event_spec.rb:51


Failures:

  1) Event tracker - Creating an event -  A user creates a new event without uploading an image
     Failure/Error: click_button "Create an event"
     
     ActionController::RoutingError:
       No route matches [POST] "/events"
```


### Updated the events controller ###
To solve this I updated the events controller to pass along the person instance variable.
```bash
gedit app/controller/events_controller.rb
```

```ruby
class EventsController < ApplicationController
  before_action :set_person, only: %i[ show new edit create update destroy ]
  before_action :set_event, only: %i[ show edit update destroy ]

  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = @person.events.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to person_event_path(@person, @event), notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: "Event was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:person_id])
    end
    
    def set_event
      @event = @person.events.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:title, :details, :day, :month, :year, :main_image, :thumb_image, :person_id)
    end
end
```

When I ran the spec it gave me the next error.
```bash
rspec spec/features/event-tracker/creating_an_event_spec.rb 
F*F

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Creating an event -  A user creates a new event including uploading an image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/creating_an_event_spec.rb:51


Failures:

  1) Event tracker - Creating an event -  A user creates a new event without uploading an image
     Failure/Error: <%= link_to 'Edit event', edit_event_path(@event) %> | <%= link_to "Delete event", event_path(@event), method: :delete, data: { confirm: "Are you sure you want to delete the event?" } %> | <%= link_to 'Back', events_path %> | <%= link_to "Home", root_path %>
     
     ActionView::Template::Error:
       undefined method `edit_event_path' for #<ActionView::Base:0x00000000009600>
       Did you mean?  edit_person_event_path
```       


### Updated the events show page ###
I updated the events show page to include the navigation links as well as the new nested routes.
```bash
gedit app/views/events/show.html.erb
```

```ruby
<h2>Navigation</h2>
<%= link_to 'Home', root_path %>
<%= link_to 'Event tracker', people_path %> 
<br>


<h1><%= @person.first_name.titleize %> <%= @person.last_name.titleize %> - <%= @event.title.capitalize %> </h1>


<h3>Flash message</h3>
<p id="notice"><%= notice %></p>
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

When I ran the spec it gave me the next error.
```bash
rspec spec/features/event-tracker/creating_an_event_spec.rb 
F*F

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Creating an event -  A user creates a new event including uploading an image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/creating_an_event_spec.rb:51


Failures:

  1) Event tracker - Creating an event -  A user creates a new event without uploading an image
     Failure/Error: expect(page).to have_content("Kirk Hammet's birthday was successfully created")
       expected to find text "Kirk Hammet's birthday was successfully created" in "Navigation\nHome Event tracker\nKirk Hammet's Birthday\nFlash message\nEvent was successfully created.\nDetails\nKirk Lee Hammett was born on November 18, 1962\nDate\n1962-11-18\nActions\nEdit event | Delete event | Back\nFooter\nCreated by Nik at 2021-05-31 13:45 Last updated by Nik at 2021-06-01 09:00"
```

### Updated the events controller ###
Just like I did with the people controller, I updated the events controller to include the event title in the flash message.
```bash
gedit app/controller/events_controller.rb
```

```ruby
  def create
    @event = @person.events.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to person_event_path(@person, @event), notice: "#{@event.title.titleize} was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: "The event was successfully updated to #{@event.title.titleize}." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end
```

When I ran the spec it gave me the next error.
```bash
rspec spec/features/event-tracker/creating_an_event_spec.rb 
.F*

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Creating an event -  A user creates a new event including uploading an image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/creating_an_event_spec.rb:103


Failures:

  1) Event tracker - Creating an event -  A user fails to create a new event
     Failure/Error: expect(page).to have_content("Navigation")
       expected to find text "Navigation" in "New Event\n1 error prohibited this event from being saved:\nTitle can't be blank\nTitle\nDetails\nDay\nMonth\nYear\nMain image\nThumb image\nBack"
```


### Updated the events new page ###
I updated the events new page to include the navigation.
```bash
gedit app/views/events/new.html.erb
```

```ruby
<h2>Navigation</h2>
<%= link_to 'Home', root_path %>
<%= link_to 'Event tracker', people_path %> 
<br>


<h1><%= @person.first_name.titleize %> <%= @person.last_name.titleize %> - New event </h1>

<h3>Flash message</h3>
<p id="notice"><%= notice %></p>
<br>


<%= render partial: 'form', :locals => {event: @event, :submit_button_label => 'Create an event'} %>


<h2>Actions</h2>
<%= link_to 'Cancel', person_path(@person) %>


<h3>Footer</h3>
Created by Nik at 2021-05-31 13:45
Last updated by Nik at 2021-06-01 09:00
```

### Updated events form partial ###
I wanted the thumb image to be created in the backend and not to be uploaded by the user. The first step was to remove the thumb image from the form partial. The actual backend processing will be handled later on.
```bash
gedit app/views/events/_form.html.erb
```

```ruby
<div class="field">
  <%= form.label :thumb_image %>
  <%= form.text_area :thumb_image %>
</div>
```

When I ran the spec it worked as expected.
```bash
rspec spec/features/event-tracker/creating_an_event_spec.rb 
..*

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Creating an event -  A user creates a new event including uploading an image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/creating_an_event_spec.rb:98


Finished in 0.66235 seconds (files took 1.01 seconds to load)
3 examples, 0 failures, 1 pending
```

### Committed the changes ###
This functionallity worked as expected and I just committed my changes.
```bash
git status
git add -A
git commit -m "Event tracker - Linked events to a person - Updated creating an event"
```

----------
[<< Previous Chapter](../section_5_linking_events_to_person/5_5_deleting_a_person.md) | [Table Of Contents](../how_i_developed_this_rails_application.md) | [Next Chapter >>](../section_5_event_tracker_linking_events_to_person/5_7_listing_events.md)






















### Added navigation to the persons new page ###
I updated the persons new file to include the navigation and the footer.
```bash
gedit app/views/people/new.html.erb
```

```ruby
<h2>Navigation</h2>
<%= link_to 'Home', root_path %>
<%= link_to 'Event tracker', people_path %> 
<br>


<h1>New person</h1>
<br>


<h3>Flash message</h3>
<p id="notice"><%= notice %></p>
<br>


<%= render partial: 'form', :locals => {person: @person, :submit_button_label => 'Create a person'} %>


<h2>Actions</h2>
<%= link_to 'Cancel', people_path %>


<h3>Footer</h3>
Created by Nik at 2021-05-31 13:45
Last updated by Nik at 2021-06-01 09:00
```

When I re-ran the spec it gave me the next error.
```bash
rspec spec/features/event-tracker/creating_a_person_spec.rb 
.*.F

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Creating a person -  A user creates a new person including uploading an image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/creating_a_person_spec.rb:47


Failures:

  1) Event tracker - Creating a person -  A user cancels the creation of a new person
     Failure/Error: expect(page).to have_content("Navigation")
       expected to find text "Navigation" in "Listing people\nNo people have been created\nNew person | Event tracker | Home"
```

### Added navigation to the people index page ###
I updated the people index file to include the navigation and the footer.
```bash
gedit app/views/people/index.html.erb
```

```ruby
<h2>Navigation</h2>
<%= link_to 'Home', root_path %>
<%= link_to 'Event tracker', people_path %> 
<br>


<h1>Listing people</h1>
<br>


<h3>Flash message</h3>
<p id="notice"><%= notice %></p>
<br>


<h2>People</h2>
<% if @people.empty? %>
    <h1 id="no-people">No people have been created</h1>
<% else %>
    <% @people.each do |person| %>
     <p><%= link_to "#{person.first_name.titleize} #{person.last_name.titleize}", person_path(person) %></p>
    <% end %>
<% end %>
<br>


<h2>Actions</h2>
<%= link_to 'New person', new_person_path %> 
<br>


<h3>Footer</h3>
Created by Nik at 2021-05-31 13:45
Last updated by Nik at 2021-06-01 09:00
```

When I re-ran the spec it worked as expected.
```bash
rspec spec/features/event-tracker/creating_a_person_spec.rb 
.*..

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Creating a person -  A user creates a new person including uploading an image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/creating_a_person_spec.rb:47


Finished in 0.58084 seconds (files took 0.93234 seconds to load)
4 examples, 0 failures, 1 pending
```

### Nested the routes ###
I wanted the events to be nested under the person. To do that I updated the routes file.
```bash
gedit config/routes.rb
```

```ruby
Rails.application.routes.draw do
  root to: 'pages#home'

  get 'home',           to: 'pages#home'
  get 'about',          to: 'pages#about'
  get 'contact',        to: 'pages#contact'
  get 'event-tracker',  to: 'pages#event_tracker'
  
  resources :people do
    resources :events
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
```

When I re-ran the spec it gave me the next error.
```bash
rspec spec/features/event-tracker/creating_a_person_spec.rb 
F*FF

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Creating a person -  A user creates a new person including uploading an image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/creating_a_person_spec.rb:47


Failures:

  1) Event tracker - Creating a person -  A user creates a new person without uploading an image
     Failure/Error: <%= link_to 'Events', events_path %>
     
     ActionView::Template::Error:
       undefined local variable or method `events_path' for #<ActionView::Base:0x00000000009178>
       Did you mean?  event_tracker_path
```

This error was caused by the routing engine and to resolve it I added an extra route to the events index page.

```ruby
  resources :people do
    resources :events
  end
  resources :events, :only => [:index]
```

When I re-ran the spec it gave me the next error.
```bash
rspec spec/features/event-tracker/creating_a_person_spec.rb 
F*..

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Creating a person -  A user creates a new person including uploading an image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/creating_a_person_spec.rb:47


Failures:

  1) Event tracker - Creating a person -  A user creates a new person without uploading an image
     Failure/Error: <%= link_to 'New event', new_event_path %>
     
     ActionView::Template::Error:
       undefined local variable or method `new_event_path' for #<ActionView::Base:0x00000000009538>
       Did you mean?  new_person_event_path
```

### Updated persons show page ###
Since I have added nesting I had to update the *new event path* on the persons show page and I also neew to include the person id as part of the path.
```bash
gedit app/views/people/show.html.erb
```

```ruby
<%= link_to 'New event', new_person_event_path(@person) %> 
```

When I re-ran the spec it worked as expected.
```bash
rspec spec/features/event-tracker/creating_a_person_spec.rb 
.*..

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Creating a person -  A user creates a new person including uploading an image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/creating_a_person_spec.rb:47


Finished in 0.565 seconds (files took 0.95892 seconds to load)
4 examples, 0 failures, 1 pending
```

### Committed the changes ###
I was expecting that most of my other tests will failed and I planned to work through them one by one.
```bash
git status
git add -A
git commit -m "Event tracker - Linked events to a person - Updated create person"
```

----------
[<< Previous Chapter](../section_5_linking_events_to_person/5_0_event_tracker_linking_events_to_person_toc.md) | [Table Of Contents](../how_i_developed_this_rails_application.md) | [Next Chapter >>](../section_5_event_tracker_linking_events_to_person/5_2_listing_people.md)
