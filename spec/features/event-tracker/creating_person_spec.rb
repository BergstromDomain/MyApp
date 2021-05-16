require "rails_helper"

RSpec.feature "Event tracker - Creating a person - " do
    scenario "A user creates a new person (without uploading an image)" do
        visit "/"
        click_link "Event tracker"
        click_link "People"
        click_link "New person"

        fill_in "First name", with: "James"
        fill_in "Last name", with: " Hetfield"
        click_button "Create Person"

        expect(page).to have_content("Person was successfully created")
        expect(current_path).to eq(person_path(Person.last.id)) 
    end

    xscenario "A user creates a new person (including uploading an image)" do
   end
end