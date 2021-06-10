require "rails_helper"

RSpec.feature "Event tracker - Deleting a person - " do
    
    before do
        @person1 = Person.create(first_name: "Kirk",
                                  last_name: "Hammet") 
    end
    
    scenario "A user deletes a person" do
        visit "/"
        click_link "Event tracker"
        click_link "People"
        click_link "Kirk Hammet"
        click_link "Delete person"

        # Expected routing
        expect(current_path).to eq(people_path) 

        # Expected navigation bar
        expect(page).to have_link("Home")
        expect(page).to have_link("About")   
        expect(page).to have_link("Contact")  
        expect(page).to have_link("Event tracker")

        # Expected page title
        # TODO Add title expectaion
        expect(page).to have_content("Listing people")

        # Expected flash message
        expect(page).to have_content("Person was successfully deleted")

        # Expected content
        # TODO Add header validation
        expect(page).not_to have_content("Kirk Hammet")

        # Expected actions
        expect(page).to have_link("New person")
   end
end