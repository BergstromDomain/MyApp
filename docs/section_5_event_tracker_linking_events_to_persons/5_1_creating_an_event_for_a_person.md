# How I developed this Ruby on Rails application #


## Event tracker - Linking events to person ##


### Creating a person ###


#### Created git branch ####
I started off by creating a new feature branch *linking-event-person*. 
```bash
git checkout -b linking-event-person
```

### Updated spec with more expectations ###
I added additional expectations to my spec file. This has nothing to do with the linking of models, I did this to get a more comprehansive list of expectation. I wanted all my pages to have:
1. Header
  - Navigation bar
2. Body
  - Page title 
  - Area for flash messages
  - Actual content
  - Content actions, usually CRUD
3. Footer
  - Created and last updated information  

Besides the expectations above, I changed the behavior so that events should be created from the persons show page.
```bash
gedit spec/features/event-tracker/creating_a_person_spec.rb
```

```ruby
require "rails_helper"

RSpec.feature "Event tracker - Creating a person - " do
    scenario "A user creates a new person without uploading an image" do
        visit "/"
        click_link "Event tracker"
        click_link "People"
        click_link "New person"

        fill_in "First name", with: "Kirk"
        fill_in "Last name", with: "Hammet"
        click_button "Create a person"

        # Expected routing
        expect(current_path).to eq(person_path(Person.last.id)) 

        # Expected navigation bar
        # TODO Add a proper navigation bar
        expect(page).to have_content("Navigation")
        expect(page).to have_link("Home")
        expect(page).to have_link("Event tracker")

        # Expected page title
        # TODO Add title expectaion
        expect(page).to have_content("Kirk Hammet")

        # Expected flash message
        expect(page).to have_content("Flash message")
        expect(page).to have_content("Person was successfully created")

        # Expected page content
        # TODO Add header expectaion
        expect(page).to have_content("Events")
        expect(page).to have_content("Kirk does not have any events")
        expect(page).to have_link("New event")

        # Expected actions
        expect(page).to have_link("Edit person")
        expect(page).to have_link("Delete person")

        # Expected footer
        # TODO Create proper footer
        expect(page).to have_content("Created by Nik at 2021-05-31 13:45")
        expect(page).to have_content("Last updated by Nik at 2021-06-01 09:00")
    end

    xscenario "A user creates a new person including uploading an image" do
   end

    scenario "A user fails to create a new person" do
        visit "/"
        click_link "Event tracker"
        click_link "People"
        click_link "New person"

        fill_in "First name", with: ""
        fill_in "Last name", with: ""
        click_button "Create a person"

        # Expected routing
        expect(current_path).to eq(people_path) 

        # Expected navigation bar
        # TODO Add a proper navigation bar
        expect(page).to have_content("Navigation")
        expect(page).to have_link("Home")
        expect(page).to have_link("Event tracker")

        # Expected page title
        # TODO Add title expectaion
        expect(page).to have_content("New person")

        # Expected flash message
        expect(page).to have_content("2 errors prohibited this person from being saved:")
        expect(page).to have_content("First name can't be blank")
        expect(page).to have_content("Last name can't be blank")

        # Expected content
        expect(page).to have_content("First name")
        expect(page).to have_content("Last name")
        expect(page).to have_content("Main image")

        # Expected actions
        expect(page).to have_selector("input[type=submit][value='Create a person']")
        expect(page).to have_link("Cancel")

        # Expected footer
        # TODO Create proper footer
        expect(page).to have_content("Created by Nik at 2021-05-31 13:45")
        expect(page).to have_content("Last updated by Nik at 2021-06-01 09:00")
    end
    
    scenario "A user cancels the creation of a new person" do
        visit "/"
        click_link "Event tracker"
        click_link "People"
        click_link "New person"

        fill_in "First name", with: "James"
        fill_in "Last name", with: "Hetfield"
        click_link "Cancel"

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
        # TODO Add expectation for no flash message

        # Expected content
        expect(page).not_to have_content("James Hetfield")

        # Expected actions
        expect(page).to have_link("New person")
        
        # Expected footer
        # TODO Create proper footer
        expect(page).to have_content("Created by Nik at 2021-05-31 13:45")
        expect(page).to have_content("Last updated by Nik at 2021-06-01 09:00")
    end    
end
```

When I ran the spec it gave me the first error.
```bash
rspec spec/features/event-tracker/creating_a_person_spec.rb 
F*FF

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Creating a person -  A user creates a new person including uploading an image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/creating_a_person_spec.rb:47


Failures:

  1) Event tracker - Creating a person -  A user creates a new person without uploading an image
     Failure/Error: expect(page).to have_content("Navigation")
       expected to find text "Navigation" in "Person was successfully created.\nKirk Hammet\nEdit person | Delete person | Back | Home"
```


### Updated persons show page ###
The error was expected since I haven't added any navigations yet. To resolve this I updated the persons show page.
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


<h2>Actions</h2>
<%= link_to 'Edit person', edit_person_path(@person) %> | 
<%= link_to 'Delete person', person_path(@person), method: :delete, data: { confirm: "Are you sure you want to delete the person?" } %> | 
<%= link_to 'Back', people_path %>
<br>


<h3>Footer</h3>
Created by Nik at 2021-05-31 13:45
Last updated by Nik at 2021-06-01 09:00
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
     Failure/Error: expect(page).to have_content("Events")
       expected to find text "Events" in "Navigation\nHome Event tracker\nKirk Hammet\nFlash message\nPerson was successfully created.\nActions\nEdit person | Delete person | Back\nFooter\nCreated by Nik at 2021-05-31 13:45 Last updated by Nik at 2021-06-01 09:00"
```       


### Linking the two models ###
To resolve this error I created a migration linking my two models together.
```bash
rails g migration add_person_reference_to_events person:references
Running via Spring preloader in process 9101
      invoke  active_record
      create    db/migrate/[DATE]_add_person_reference_to_events.rb
```  

I reviewed the generated migration file.
```bash
gedit db/migrate/[DATE]_add_person_reference_to_events.rb
```

```ruby
class AddPersonReferenceToEvents < ActiveRecord::Migration[6.1]
  def change
    add_reference :events, :person, foreign_key: true
  end
end
```

I ran the migration.
```bash
rails db:migrate
== 20210522105100 AddPersonReferenceToEvents: migrating =======================
-- add_reference(:events, :person, {:foreign_key=>true})
   -> 0.0269s
== 20210522105100 AddPersonReferenceToEvents: migrated (0.0271s) ==============
```

The next step was to update the two models with *has many* and *belongs to* statemets.
```bash
gedit app/models/person.rb
```

```ruby
class Person < ApplicationRecord
    validates :first_name, :last_name, presence: true
    
    has_many :events
end
```

```bash
gedit app/models/event.rb
```

```ruby
class Event < ApplicationRecord
    validates :title, presence: true
    
    belongs_to :person
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
     Failure/Error: expect(page).to have_content("No events have been created for Kirk")
       expected to find text "No events have been created for Kirk" in "Navigation\nHome Event tracker\nKirk Hammet\nFlash message\nPerson was successfully created.\nEvents\nActions\nEdit person | Delete person | Back\nFooter\nCreated by Nik at 2021-05-31 13:45 Last updated by Nik at 2021-06-01 09:00"
```       


### Added events to the persons show page ###
My next step was to display events on the show page. Since this is a new person there will be no events.
```bash
gedit app/views/people/show.html.erb
```

```ruby
<h2>Events</h2>
<% if @person.events.empty? %>
    <h4 id="no-events"><%= @person.first_name.titleize %> does not have any events</h4>
<% end %>

<%= link_to 'New event', new_event_path %> 
<br>
```

When I re-ran the spec it gave me the next error.
```bash
rspec spec/features/event-tracker/creating_a_person_spec.rb 
.*FF

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Creating a person -  A user creates a new person including uploading an image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/creating_a_person_spec.rb:47


Failures:

  1) Event tracker - Creating a person -  A user fails to create a new person
     Failure/Error: expect(page).to have_content("Navigation")
       expected to find text "Navigation" in "New person\n2 errors prohibited this person from being saved:\nFirst name can't be blank Last name can't be blank\nFirst name\nLast name\nMain image\nThumb image\nBack"
```

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

### Nesting the routes ###
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

























