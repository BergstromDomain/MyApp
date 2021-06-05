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
end