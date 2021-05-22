require "rails_helper"

RSpec.feature "Event tracker - Deleting a person - " do
    
    before do
        @person1 = Person.create(first_name: "kirk",
                                  last_name: "hammet") 
        @person2 = Person.create(first_name: "JAMES",
                                  last_name: "HETFIELD") 
        @person3 = Person.create(first_name: "Lars",
                                  last_name: "Ulrich") 
    end
    
    scenario "A user deletes a person" do
        visit "/"
        click_link "Event tracker"
        click_link "People"
        click_link "Kirk Hammet"
        click_link "Delete person"

        # Expected flash message
        expect(page).to have_content("Person was successfully deleted")

        # Expected navigation

        # Expected content
        expect(page).not_to have_content("Kirk Hammet")
        
        # Expected path
        expect(current_path).to eq(people_path) 
   end
end