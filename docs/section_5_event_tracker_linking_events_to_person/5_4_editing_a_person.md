# How I developed this Ruby on Rails application #


## Event tracker - Linking events to person ##


### Editing a person ###


### Updated spec with more expectations ###
Just like the with the previous specs, I added additional expectations to the editing person spec.
```bash
gedit spec/features/event-tracker/editing_a_person_spec.rb
```

```ruby
require "rails_helper"

RSpec.feature "Event tracker - Editing a person - " do

    before do
        @person1 = Person.create(first_name: "James",
                                  last_name: "Hetfield") 
        @person2 = Person.create(first_name: "Lars",
                                  last_name: "Ulrich") 
    end

    scenario "A user updates a person" do
        visit "/"
        click_link "Event tracker"
        click_link "People"
        click_link "James Hetfield"
        click_link "Edit person"

        fill_in "First name", with: "Robert"
        fill_in "Last name", with: "Trujillo"
        click_button "Update the person"

        # Expected routing
        expect(current_path).to eq(person_path(@person1))
        
        # Expected navigation bar
        # TODO Add a proper navigation bar
        expect(page).to have_content("Navigation")
        expect(page).to have_link("Home")
        expect(page).to have_link("Event tracker")        

        # Expected page title
        # TODO Add title expectaion
        expect(page).to have_content("Robert Trujillo")
        
        # Expected flash message
        expect(page).to have_content("The person was successfully updated to Robert Trujillo.")

        # Expected content
        # TODO Add header validation
        expect(page).to have_content("Events")
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

    scenario "A user fails to update a person" do
        visit "/"
        click_link "Event tracker"
        click_link "People"
        click_link "Lars Ulrich"
        click_link "Edit person"

        fill_in "First name", with: ""
        fill_in "Last name", with: ""
        click_button "Update the person"
        
         # Expected routing
        expect(current_path).to eq(person_path(@person2))
        
        # Expected navigation bar
        # TODO Add a proper navigation bar
        expect(page).to have_content("Navigation")
        expect(page).to have_link("Home")
        expect(page).to have_link("Event tracker")        

        # Expected page title
        # TODO Add title expectaion
        expect(page).to have_content("Editing")
        
        # Expected flash message
        expect(page).to have_content("2 errors prohibited this person from being saved:")
        expect(page).to have_content("First name can't be blank")
        expect(page).to have_content("Last name can't be blank")

        # Expected content
        # TODO Add header validation
        expect(page).to have_content("First name")
        expect(page).to have_content("Last name")
        expect(page).to have_content("Main image")
        expect(page).not_to have_content("Thumb image")

        # Expected actions
        expect(page).to have_selector("input[type=submit][value='Update the person']")
        expect(page).to have_link("Cancel")
        
        # Expected footer
        # TODO Create proper footer
        expect(page).to have_content("Created by Nik at 2021-05-31 13:45")
        expect(page).to have_content("Last updated by Nik at 2021-06-01 09:00")
    end

    xscenario "A user updates a person including uploading a new image" do
   end

    xscenario "A user updates a person and removes the uploaded image" do
   end
end```

When I ran the spec it gave me the first error.
```bash
rspec spec/features/event-tracker/editing_a_person_spec.rb 
FF**

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Editing a person -  A user updates a person including uploading a new image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/editing_a_person_spec.rb:101

  2) Event tracker - Editing a person -  A user updates a person and removes the uploaded image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/editing_a_person_spec.rb:104


Failures:

  1) Event tracker - Editing a person -  A user updates a person
     Failure/Error: expect(page).to have_content("Robert Trujillo was successfully updated")
       expected to find text "Robert Trujillo was successfully updated" in "Navigation\nHome Event tracker\nRobert Trujillo\nFlash message\nPerson was successfully updated.\nEvents\nRobert does not have any events\nNew event\nActions\nEdit person | Delete person | Back\nFooter\nCreated by Nik at 2021-05-31 13:45 Last updated by Nik at 2021-06-01 09:00"
```


### Updated person controller ###
I updated the flash message in the person controller to include the persons name. I did this for both the create and update actions.
```bash
gedit app/controllers/people_controller.rb
```

```ruby
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: "#{@person.first_name.titleize} #{@person.last_name.titleize} was successfully created." }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1 or /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: "The person was successfully updated to #{@person.first_name.titleize} #{@person.last_name.titleize}." }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end
```

When I ran the spec it gave me the next error.
```bash
rspec spec/features/event-tracker/editing_a_person_spec.rb 
.F**

Pending: (Failures listed here are expected and do not affect your suite's status)


  1) Event tracker - Editing a person -  A user updates a person including uploading a new image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/editing_a_person_spec.rb:101

  2) Event tracker - Editing a person -  A user updates a person and removes the uploaded image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/editing_a_person_spec.rb:104

Failures:

  1) Event tracker - Editing a person -  A user fails to update a person
     Failure/Error: expect(page).to have_content("Navigation")       expected to find text "Navigation" in "Editing person\n2 errors prohibited this person from being saved:\nFirst name can't be blank Last name can't be blank\nFirst name\nLast name\nMain image\nThumb image\nShow | Back"
```

### Updated persons edit page ###
I updated the persons edit page and added the navigation.
```bash
gedit app/views/people/edit.html.erb
```

```ruby
<h2>Navigation</h2>
<%= link_to 'Home', root_path %>
<%= link_to 'Event tracker', people_path %> 
<br>


<h1>Editing <%= @person.first_name.titleize %> <%= @person.last_name.titleize %> </h1>
<br>


<h3>Flash message</h3>
<p id="notice"><%= notice %></p>
<br>


<%= render partial: 'form', :locals => {person: @person, :submit_button_label => 'Update the person'} %>


<h2>Actions</h2>
<%= link_to 'Cancel', people_path %>


<h3>Footer</h3>
Created by Nik at 2021-05-31 13:45
Last updated by Nik at 2021-06-01 09:00
```

When I ran the spec it gave me the next error.
```bash
rspec spec/features/event-tracker/editing_a_person_spec.rb 
.F**

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Editing a person -  A user updates a person including uploading a new image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/editing_a_person_spec.rb:101

  2) Event tracker - Editing a person -  A user updates a person and removes the uploaded image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/editing_a_person_spec.rb:104


Failures:
  1) Event tracker - Editing a person -  A user fails to update a person
     Failure/Error: expect(page).not_to have_content("Thumb image")
       expected not to find text "Thumb image" in "Navigation\nHome Event tracker\nEditing\nFlash message\n2 errors prohibited this person from being saved:\nFirst name can't be blank Last name can't be blank\nFirst name\nLast name\nMain image\nThumb image\nActions\nCancel\nFooter\nCreated by Nik at 2021-05-31 13:45 Last updated by Nik at 2021-06-01 09:00"
```


### Updated persons form partial ###
I wanted the thumb image to be created in the backend and not to be uploaded by the user. The first step was to remove the thumb image from the form partial. The actual backend processing will be handled later on.
```bash
gedit app/views/people/_form.html.erb
```

```ruby
<div class="field">
  <%= form.label :thumb_image %>
  <%= form.text_area :thumb_image %>
</div>
```

When I ran the spec it worked as expected.
```bash
rspec spec/features/event-tracker/editing_a_person_spec.rb 
..**

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Editing a person -  A user updates a person including uploading a new image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/editing_a_person_spec.rb:101

  2) Event tracker - Editing a person -  A user updates a person and removes the uploaded image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/editing_a_person_spec.rb:104


Finished in 0.59409 seconds (files took 1.46 seconds to load)
4 examples, 0 failures, 2 pending
```


### Committed the changes ###
This functionallity worked as expected and I just committed my changes.
```bash
git status
git add -A
git commit -m "Event tracker - Linked events to a person - Updated editing a person"
```

----------
[<< Previous Chapter](../section_5_linking_events_to_person/5_3_showing_a_person.md) | [Table Of Contents](../how_i_developed_this_rails_application.md) | [Next Chapter >>](../section_5_event_tracker_linking_events_to_person/5_5_deleting_a_person.md)
