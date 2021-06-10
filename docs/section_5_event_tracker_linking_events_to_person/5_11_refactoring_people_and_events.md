# How I developed this Ruby on Rails application #


## Event tracker - Linking events to person ##


### Refactoring people and events ###


### Running all specs ###
Once I have gone throug hall specs one by one it was time to run them all to ensure they still worked. When I ran the specs they gave me the first error.
```bash
rspec spec/features/event-tracker/
.*...F*....**..**..........**..*

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Creating a person -  A user creates a new person including uploading an image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/creating_a_person_spec.rb:47

  2) Event tracker - Creating an event -  A user creates a new event including uploading an image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/creating_an_event_spec.rb:98

  3) Event tracker - Editing a person -  A user updates a person including uploading a new image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/editing_a_person_spec.rb:101

  4) Event tracker - Editing a person -  A user updates a person and removes the uploaded image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/editing_a_person_spec.rb:104

  5) Event tracker - Editing an event -  A user updates an event including uploading a new image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/editing_an_event_spec.rb:123

  6) Event tracker - Editing an event -  A user updates an event and removes the uploaded image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/editing_an_event_spec.rb:126

  7) Event Tracker - Showing a person -  A user shows a person without an uploaded image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/showing_a_person_spec.rb:197

  8) Event Tracker - Showing a person -  A user shows a person with an uploaded image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/showing_a_person_spec.rb:200

  9) Event tracker - Showing an event -  A user shows an event with an uploaded image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/showing_an_event_spec.rb:99


Failures:

  1) Event tracker - Creating an event -  A user fails to create a new event
     Failure/Error: expect(page).to have_content("1 error prohibited this event from being saved:")
       expected to find text "1 error prohibited this event from being saved:" in "Navigation\nHome Event tracker\nKirk Hammet - New event\nFlash message\n4 errors prohibited this event from being saved:\nTitle can't be blank Year can't be blank Month can't be blank Day can't be blank\nTitle\nDetails\nDay\nMonth\nYear\nMain image\nActions\nCancel\nFooter\nCreated by Nik at 2021-05-31 13:45 Last updated by Nik at 2021-06-01 09:00"
     # ./spec/features/event-tracker/creating_an_event_spec.rb:80:in `block (2 levels) in <main>'

Finished in 2.32 seconds (files took 1.28 seconds to load)
32 examples, 1 failure, 9 pending
```

### Updated the creating an event spec ###
I updated the spec to include the validation for the year, month and day. When I ran the specs they worked as expected.
```bash
rspec spec/features/event-tracker/

rspec spec/features/event-tracker/
.*....*....**..**..........**..*

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Creating a person -  A user creates a new person including uploading an image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/creating_a_person_spec.rb:47

  2) Event tracker - Creating an event -  A user creates a new event including uploading an image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/creating_an_event_spec.rb:101

  3) Event tracker - Editing a person -  A user updates a person including uploading a new image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/editing_a_person_spec.rb:101

  4) Event tracker - Editing a person -  A user updates a person and removes the uploaded image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/editing_a_person_spec.rb:104

  5) Event tracker - Editing an event -  A user updates an event including uploading a new image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/editing_an_event_spec.rb:123

  6) Event tracker - Editing an event -  A user updates an event and removes the uploaded image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/editing_an_event_spec.rb:126

  7) Event Tracker - Showing a person -  A user shows a person without an uploaded image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/showing_a_person_spec.rb:197

  8) Event Tracker - Showing a person -  A user shows a person with an uploaded image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/showing_a_person_spec.rb:200

  9) Event tracker - Showing an event -  A user shows an event with an uploaded image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/showing_an_event_spec.rb:99


Finished in 2.45 seconds (files took 0.96237 seconds to load)
32 examples, 0 failures, 9 pending
```


### Created the first navbar ###
I updated the application layout `app/views/layout/application.html.erb` and added a navigation partial to it.
```ruby
<%= render "shared/nav", location: 'top' %>
```

I created a `app/views/shared` folder and added `_nav.html.erb` to it.
```ruby
<div class="<%= location %>">
  <div><%= link_to "Home", root_path %></div>
  <div><%= link_to "About", about_path %></div>
  <div><%= link_to "Contact", contact_path %></div>
  <div><%= link_to 'Event tracker', people_path %></div> 
</div>
```

The next step was to remove the manually added navbars from my view files.
- `app/views/events/new.html.erb`
- `app/views/events/index.html.erb`
- `app/views/events/show.html.erb`
- `app/views/events/edit.html.erb`
- `app/views/pages/about.html.erb`
- `app/views/pages/contact.html.erb`
- `app/views/pages/event_tracker.html.erb`
- `app/views/pages/home.html.erb`
- `app/views/people/new.html.erb`
- `app/views/people/index.html.erb`
- `app/views/people/show.html.erb`
- `app/views/people/edit.html.erb`


### Updated the controllers ###
I removed the `json` format and the comments from both `app/controllers/events_controller.rb` and `app/controllers/people_controller.rb`.


When I ran the specs it worked as expected.
```bash
rspec spec/features/
.*....*....**..**..........**..*..

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Creating a person -  A user creates a new person including uploading an image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/creating_a_person_spec.rb:47

  2) Event tracker - Creating an event -  A user creates a new event including uploading an image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/creating_an_event_spec.rb:101

  3) Event tracker - Editing a person -  A user updates a person including uploading a new image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/editing_a_person_spec.rb:101

  4) Event tracker - Editing a person -  A user updates a person and removes the uploaded image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/editing_a_person_spec.rb:104

  5) Event tracker - Editing an event -  A user updates an event including uploading a new image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/editing_an_event_spec.rb:123

  6) Event tracker - Editing an event -  A user updates an event and removes the uploaded image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/editing_an_event_spec.rb:126

  7) Event Tracker - Showing a person -  A user shows a person without an uploaded image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/showing_a_person_spec.rb:197

  8) Event Tracker - Showing a person -  A user shows a person with an uploaded image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/showing_a_person_spec.rb:200

  9) Event tracker - Showing an event -  A user shows an event with an uploaded image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/showing_an_event_spec.rb:99


Finished in 2.33 seconds (files took 0.9684 seconds to load)
34 examples, 0 failures, 9 pending
```

### Created a seeds file ###
I created `db/seeds.rb` to populate test data.
```ruby
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Event.delete_all
Person.delete_all

15.times do |person|
    Person.create!(
        first_name: "First Name #{person+1}",
        last_name: "Last Name #{person+1}",
        main_image: "http://placeimg.com/600/400/people",
        thumb_image: "http://placeimg.com/350/200/people"
        )
end
puts "15 new persons created"

last_person_id = Person.last.id
12.times do |event|
    Event.create!(
        title: "Birthday",
        details: "The person was born",
        main_image: "http://placeimg.com/600/400/nature",
        thumb_image: "http://placeimg.com/350/200/nature",
        day: "#{2*event+1}",
        month: "#{event+1}",
        year: "#{1950+5*event}",
        person_id: "#{last_person_id-1-event}"
        )
end
puts "12 new birthday events created"


6.times do |event|
    Event.create!(
        title: "Graduation",
        details: "Name #{event+1} graduated on #{event+1}-#{event+1}-#{event+2001}",
        main_image: "http://placeimg.com/600/400/nature",
        thumb_image: "http://placeimg.com/350/200/nature",
        day: "#{2*event+1}",
        month: "#{event+1}",
        year: "#{2000+2*event}",
        person_id: "#{last_person_id-1}"
        )
end
puts "6 new graduation events created"
```bash

I ran the seeds file to populate the development database.
```bash
rails db:setup
Database 'MainApp_development' already exists
Database 'MainApp_test' already exists
15 new persons created
12 new birthday events created
6 new wedding events created
```


### Committed the changes ###
This functionallity worked as expected and I just committed my changes.
```bash
git status
git add -A
git commit -m "Event tracker - Linked events to a person - Refactored people and events"
```

----------
[<< Previous Chapter](../section_5_linking_events_to_person/5_9_editing_an_event.md) | [Table Of Contents](../how_i_developed_this_rails_application.md) | [Next Chapter >>](../section_5_event_tracker_linking_events_to_person/5_11_refactoring.md)
