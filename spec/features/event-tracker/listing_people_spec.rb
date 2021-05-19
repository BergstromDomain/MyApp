require "rails_helper"

RSpec.feature "Event tracker - Listing people - " do
    
    before do
        @person1 = Person.create(first_name: "kirk",
                                  last_name: "hammet") 
        @person2 = Person.create(first_name: "JAMES",
                                  last_name: "HETFIELD") 
        @person3 = Person.create(first_name: "Lars",
                                  last_name: "Ulrich") 
    end
    
    scenario "A user lists all people" do
        visit "/"
        click_link "Event tracker"
        click_link "People"

        expect(page).to have_content("Kirk Hammet")
        expect(page).to have_link("Kirk Hammet")

        expect(page).to have_content("James Hetfield")
        expect(page).to have_link("James Hetfield")

        expect(page).to have_content("Lars Ulrich")
        expect(page).to have_link("Lars Ulrich")
   end

    scenario "A user tries to lists all people but there are none" do
       Person.delete_all
        visit "/"
        click_link "Event tracker"
        click_link "People"

        expect(page).not_to have_content("Kirk Hammet")
        expect(page).not_to have_link("Kirk Hammet")

        expect(page).not_to have_content("James Hetfield")
        expect(page).not_to have_link("James Hetfield")

        expect(page).not_to have_content("Lars Ulrich")
        expect(page).not_to have_link("Lars Ulrich")

        within ("h1#no-people") do
            expect(page).to have_content("No people have been created")
        end
    end
end
