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
        expect(page).not_to have_content("Thumb image")

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