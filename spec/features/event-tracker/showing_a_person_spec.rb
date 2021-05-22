require "rails_helper"

RSpec.feature "Event Tracker - Showing A Person - " do
    
    before do
        @person1 = Person.create(first_name: "kirk",
                                  last_name: "hammet") 
        @person2 = Person.create(first_name: "JAMES",
                                  last_name: "HETFIELD") 
        @person3 = Person.create(first_name: "Lars",
                                  last_name: "Ulrich") 
    end
    
    scenario "A user shows a person without an uploaded image - Name entered in lowercase letters" do
        visit "/"
        click_link "Event tracker"
        click_link "People"
        click_link "Kirk Hammet"

        # Expected flash message

        # Expected content
        expect(page).to have_content("Kirk Hammet")

        # Expected navigation
        expect(page).to have_link("Edit person")
        expect(page).to have_link("Back")
        expect(page).to have_link("Home")

        # Expected path
        expect(current_path).to eq(person_path(@person1))
   end
   
    scenario "A user shows a person without an uploaded image - Name entered in uppercase letters" do
        visit "/"
        click_link "Event tracker"
        click_link "People"
        click_link "James Hetfield"

        # Expected flash message

        # Expected content
        expect(page).to have_content("James Hetfield")

        # Expected navigation
        expect(page).to have_link("Edit person")
        expect(page).to have_link("Back")
        expect(page).to have_link("Home")

        # Expected path
        expect(current_path).to eq(person_path(@person2))
   end

    scenario "A user shows a person without an uploaded image - Name entered in capitalized letters" do
        visit "/"
        click_link "Event tracker"
        click_link "People"
        click_link "Lars Ulrich"

        # Expected flash message

        # Expected content
        expect(page).to have_content("Lars Ulrich")

        # Expected navigation
        expect(page).to have_link("Edit person")
        expect(page).to have_link("Back")
        expect(page).to have_link("Home")

        # Expected path
        expect(current_path).to eq(person_path(@person3))
   end

    xscenario "A user shows a person with an uploaded image - Name entered in lowercase letters" do
    end

    xscenario "A user shows a person witht an uploaded image - Name entered in uppercase letters" do
    end
    
    xscenario "A user shows a person with an uploaded image - Name entered in capitalized letters" do
    end
    
end
