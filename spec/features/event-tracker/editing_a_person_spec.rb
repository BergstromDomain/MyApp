require "rails_helper"

RSpec.feature "Event tracker - Editing a person - " do

    before do
        @person1 = Person.create(first_name: "kirk",
                                  last_name: "hammet") 
        @person2 = Person.create(first_name: "JAMES",
                                  last_name: "HETFIELD") 
        @person3 = Person.create(first_name: "Lars",
                                  last_name: "Ulrich") 
    end

    scenario "A user updates a person without uploading a new image" do
        visit "/"
        click_link "Event tracker"
        click_link "People"
        click_link "Kirk Hammet"
        click_link "Edit person"

        fill_in "First name", with: "Robert"
        fill_in "Last name", with: "Trujillo"
        click_button "Update the person"

        # Expected flash message
        expect(page).to have_content("Person was successfully updated")

        # Expected content
        
        # Expected navigation

        # Expected path
        expect(current_path).to eq(person_path(@person1)) 
    end

    scenario "A user fails to update a person" do
        visit "/"
        click_link "Event tracker"
        click_link "People"
        click_link "James Hetfield"
        click_link "Edit person"

        fill_in "First name", with: ""
        fill_in "Last name", with: ""
        click_button "Update the person"

        # Expected flash message
        expect(page).to have_content("2 errors prohibited this person from being saved:")
        expect(page).to have_content("First name can't be blank")
        expect(page).to have_content("Last name can't be blank")

        # Expected content
        
        # Expected navigation

        # Expected path
        expect(current_path).to eq(person_path(@person2)) 
    end

    xscenario "A user updates a person including uploading a new image" do
   end

    xscenario "A user updates a person and removes the uploaded image" do
   end

end