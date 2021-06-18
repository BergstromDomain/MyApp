# How I developed this Ruby on Rails application #


## Event tracker - Person ##


### Creating a person ###


#### Created git branches ####
I started off by creating a new branch for the *Event-tracker* app. Within this branch I created a feature branch *create-person*. 
```bash
git checkout -b event-tracker
git checkout -b create-person
```

#### Created the spec ####
To keep my tests organised, I created a new folder for the app and I created a spec for the new feature.
```bash
mkdir spec/features/event-tracker
gedit spec/features/event-tracker/creating_person_spec.rb
```

I decided to keep the first version of the test very simple but I plan to add more validations later on. I also decided to save image uploading to later when I have some more development experience so I included a pending test to ensure that I dont forget it later on.
```ruby
require "rails_helper"

RSpec.feature "Event tracker - Creating a person - " do
    scenario "A user creates a new person (without uploading an image)" do
        visit "/"
        click_link "Event tracker"
        click_link "People"
        click_link "New person"

        fill_in "First name", with: "James"
        fill_in "Last name", with: " Hetfield"
        click_button "Create person"

        expect(page).to have_content("Person was successfully created")
        expect(current_path).to eq(person_path(Person.last.id)) 
   end

    xscenario "A user creates a new person (including uploading an image)" do
   end
end
```

When I ran the spec it gave me the first error.
```bash
rspec spec/features/event-tracker/creating_person_spec.rb 
F*

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Creating a person -  A user creates a new person (without uploading an image)
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/creating_person_spec.rb:17


Failures:

  1) Event tracker - Creating a person -  A user creates a new person (without uploading an image)
     Failure/Error: click_link "Event tracker"
     
     Capybara::ElementNotFound:
       Unable to find link "Event tracker"
```


#### Generated the model ####
The next thing I did was to generate the *Person* model using scaffolding.
```bash
rails g scaffold Person first_name:string last_name:string main_image:text thumb_image:text
```

I reviewed the migration file, `db/migrate/20210407114922_create_people.rb` before running the migration to ensure everything was as expected.
```bash
rails db:migrate
== 20210515220840 CreatePeople: migrating =====================================
-- create_table(:people)
   -> 0.0434s
== 20210515220840 CreatePeople: migrated (0.0436s) ============================
```


#### Created an event tracker landing page ####
I want the event tracker to have it's own landing page from which I can create persons and events. To fix this I started by updating the routes file, `gedit config/routes.rb`.

```ruby
Rails.application.routes.draw do
  root to: 'pages#home'
  
  get 'home',           to: 'pages#home'
  get 'about',          to: 'pages#about'
  get 'contact',        to: 'pages#contact'
  get 'event-tracker',  to: 'pages#event_tracker'

  resources :people
end
```

The next step was to update the pages controller, `gedit app/controllers/pages_controller.rb`, and define a method.
```ruby
def event_tracker
end
```

I updated the home page and added a link to the event tracker page.
```ruby
<%= link_to "Event tracker", event_tracker_path %>
```

Finally I created the event tracker page and added the required links to it.
```ruby
<h1>Event tracker</h1>

<%= link_to 'People', people_path %>
<%= link_to "Home", root_path %>
```


When I re-ran the spec it worked as expected.
```bash
rspec spec/features/event-tracker/creating_person_spec.rb 
.*

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Creating a person -  A user creates a new person (including uploading an image)
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/creating_person_spec.rb:18


Finished in 0.16027 seconds (files took 1.06 seconds to load)
2 examples, 0 failures, 1 pending
```


#### Committing the changes ####
Before I committed any changes I made sure that all existing tests passed.
```bash
rspec spec/features/
.*..

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Creating a person -  A user creates a new person (including uploading an image)
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/creating_person_spec.rb:18


Finished in 0.44885 seconds (files took 2.88 seconds to load)
4 examples, 0 failures, 1 pending
```bash

```bash
git status
git add -A 
git commit -m "Event tracker - Implemented creating a person"
```


#### Added datavalidation ####
I updated the spec to inclue a negative scenario.
```ruby
    scenario "A user fails to create a new person" do
        visit "/"
        click_link "Event tracker"
        click_link "People"
        click_link "New person"

        fill_in "First name", with: ""
        fill_in "Last name", with: ""
        click_button "Create Person"

        expect(page).to have_content("2 errors prohibited this person from being saved:")
        expect(page).to have_content("First name can't be blank")
        expect(page).to have_content("Last name can't be blank")

        expect(current_path).to eq(people_path) 
    end
```

When I re-ran the spec it gave me the next error.
```bash
rspec spec/features/event-tracker/creating_person_spec.rb 
.*F

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Creating a person -  A user creates a new person (including uploading an image)
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/creating_person_spec.rb:18


Failures:

  1) Event tracker - Creating a person -  A user fails to create a new person
     Failure/Error: expect(page).to have_content("2 errors prohibited this person from being saved:")
       expected to find text "2 errors prohibited this person from being saved:" in "Person was successfully created.\nFirst name:\nLast name:\nMain image:\nThumb image:\nEdit | Back"
```       


### Updated the person model ###
I updated the person model, `app/models/person.rb` and added data validation to it.
```ruby
class Person < ApplicationRecord
    validates :first_name, :last_name, presence: true
end
```

When I re-ran the spec it worked as expected.
```bash
rspec spec/features/event-tracker/creating_person_spec.rb 
.*.

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Creating a person -  A user creates a new person (including uploading an image)
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/creating_person_spec.rb:18


Finished in 0.36839 seconds (files took 1.1 seconds to load)
3 examples, 0 failures, 1 pending
```

### Committed the changes ###
Before I committed any changes I made sure that all existing tests passed.
```bash
rspec spec/features/
.*...

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Creating a person -  A user creates a new person (including uploading an image)
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/creating_person_spec.rb:18


Finished in 0.4192 seconds (files took 1.01 seconds to load)
5 examples, 0 failures, 1 pending
```

```bash
git status
git add -A
git commit -m "Event tracker - Added data validation to the person model"
git checkout event-tracker
git merge create-person 
git push origin event-tracker
git branch -d create-person 
Deleted branch create-person (was 2ae6008).
```



----------
[<< Previous Chapter](../section_3_event_tracker_person/3_0_event_tracker_person_toc.md) | [Table Of Contents](../how_i_developed_this_rails_application.md) | [Next Chapter >>](../section_3_event_tracker_person/3_2_listing_people.md)