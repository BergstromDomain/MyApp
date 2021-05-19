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

        expect(page).to have_content("Person was successfully created")
        expect(current_path).to eq(person_path(Person.last.id)) 
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

        expect(page).to have_content("2 errors prohibited this person from being saved:")
        expect(page).to have_content("First name can't be blank")
        expect(page).to have_content("Last name can't be blank")

        expect(current_path).to eq(people_path) 
    end
end