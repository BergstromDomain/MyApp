# How I developed this Ruby on Rails application #


## Blogs ##


### Creating a blog post ###


#### Created git branch ####
I started off by creating a new feature branch *blogs*.
```bash
git checkout -b blogs
```

### Created the spec ###
I created a new directory for the blog specs `spec/features/blogs/` and I created the spec in there `spec/features/blogs/creating_a_blog_post_spec.rb`

```ruby
require "rails_helper"

RSpec.feature "Blogs - Creating a blog post - " do
    scenario "A user creates a new blog post" do
        visit "/"
        click_link "Blogs"
        click_link "New blog post"

        fill_in "Title", with: "My first blog"
        fill_in "Body", with: "This is my first blog."
        click_button "Create a blog post"

        # Expected routing
        expect(current_path).to eq(blog_path(Blog.last.id))

        # Expected navigation bar
        expect(page).to have_link("Home")
        expect(page).to have_link("About")
        expect(page).to have_link("Contact")
        expect(page).to have_link("Event tracker")
        expect(page).to have_link("Blogs")

        # Expected page title
        # TODO Add title expectaion
        expect(page).to have_content("My first blog")

        # Expected flash message
        expect(page).to have_content("Flash message")
        expect(page).to have_content("My first blog was successfully created")

        # Expected page content
        # TODO Add header expectaion
        expect(page).to have_content("This is my first blog.")

        # Expected actions
        expect(page).to have_link("Edit blog post")
        expect(page).to have_link("Publish blog post")
        expect(page).to have_link("Delete blog post")

        # Expected footer
        # TODO Create proper footer
        expect(page).to have_content("Created by Nik at 2021-05-31 13:45")
        expect(page).to have_content("Last updated by Nik at 2021-06-01 09:00")
    end

    scenario "A user fails to create a new blog post" do
        visit "/"
        click_link "Blogs"
        click_link "New blog post"

        fill_in "Title", with: ""
        fill_in "Body", with: ""
        click_button "Create a blog post"

        # Expected routing
        expect(current_path).to eq(blog_path)

        # Expected navigation bar
        expect(page).to have_link("Home")
        expect(page).to have_link("About")
        expect(page).to have_link("Contact")
        expect(page).to have_link("Event tracker")
        expect(page).to have_link("Blogs")

        # Expected page title
        # TODO Add title expectaion
        expect(page).to have_content("New blog post")

        # Expected flash message
        expect(page).to have_content("1 error prohibited this blog post from being saved:")
        expect(page).to have_content("Title can't be blank")

        # Expected content
        expect(page).to have_content("Title")
        expect(page).to have_content("Body")

        # Expected actions
        expect(page).to have_selector("input[type=submit][value='Create a blog post']")
        expect(page).to have_link("Cancel")

        # Expected footer
        # TODO Create proper footer
        expect(page).to have_content("Created by Nik at 2021-05-31 13:45")
        expect(page).to have_content("Last updated by Nik at 2021-06-01 09:00")
    end

    scenario "A user cancels the creation of a new blog post" do
        visit "/"
        click_link "Blogs"
        click_link "New blog post"

        fill_in "Title", with: "My second blog"
        fill_in "Body", with: "This is my second blog."
        click_button "Cancel"

        # Expected routing
        expect(current_path).to eq(blogs_path)

        # Expected navigation bar
        expect(page).to have_link("Home")
        expect(page).to have_link("About")
        expect(page).to have_link("Contact")
        expect(page).to have_link("Event tracker")
        expect(page).to have_link("Blogs")

        # Expected page title
        # TODO Add title expectaion
        expect(page).to have_content("Blog posts")

        # Expected flash message
        # TODO Add expectation for no flash message

        # Expected content
        expect(page).not_to have_content("My second blog")

        # Expected actions
        expect(page).to have_link("New blog post")

        # Expected footer
        # TODO Create proper footer
        expect(page).to have_content("Created by Nik at 2021-05-31 13:45")
        expect(page).to have_content("Last updated by Nik at 2021-06-01 09:00")
    end
end
```

When I ran the spec it gave me the first error.
```bash
rspec spec/features/blogs/                                                                                                                                                                                                                                                                                                                                                                                                                              
FFF

Failures:

  1) Blogs - Creating a blog post -  A user creates a new blog post
     Failure/Error: click_link "Blogs"

     Capybara::ElementNotFound:
       Unable to find link "Blogs"
```

When I re-ran the spec it gave me the next error.
```bash
rspec spec/features/blogs/                                                                                                                                                                                                                                                                                                                                                                                                                              


### Updated nav bar partial ###
I added a link to the blogs index page to the nav bar partial `app/views/shared/_nav.html.erb`.
```ruby
<div class="<%= location %>">
  <div><%= link_to "Home", root_path %></div>
  <div><%= link_to "About", about_path %></div>
  <div><%= link_to "Contact", contact_path %></div>
  <div><%= link_to 'Blogs', blogs_path %></div>
  <div><%= link_to 'Event tracker', event_tracker_path %></div>
</div>
```

### Generated the blog app using scaffold ###
I created the blog app using scaffold.
```bash
rails g scaffold Blog title:string body:text
```

When I ran the spec it gave me the next error.
```bash
rspec spec/features/blogs/
FFF

Failures:

  1) Blogs - Creating a blog post -  A user creates a new blog post
     Failure/Error: click_link "New blog post"

     Capybara::ElementNotFound:
       Unable to find link "New blog post"
```


### Updated blog index page ###
I updated the link in the `app/views/blogs/index.html.erb` to macth my spec.
```ruby
<%= link_to 'New blog post', new_blog_path %>
```


### Updated blog new page ###
I updated the link in the `app/views/blogs/new.html.erb` to macth my spec.
```ruby
<h1>New blog post</h1>
<br>


<h3>Flash message</h3>
<p id="notice"><%= notice %></p>
<br>


<%= render partial: 'form', :locals => {blog: @blog, :submit_button_label => 'Create a blog post'} %>


<h2>Actions</h2>
<%= link_to 'Cancel', blogs_path %>


<h3>Footer</h3>
Created by Nik at 2021-05-31 13:45
Last updated by Nik at 2021-06-01 09:00
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
