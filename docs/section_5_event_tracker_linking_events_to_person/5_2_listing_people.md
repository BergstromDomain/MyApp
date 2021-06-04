

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
        # TODO Do not expect any flash messages
        
        # Expected content
        # TODO Add header validation        
        expect(page).to have_content("Kirk Hammet")
        expect(page).to have_link("Kirk Hammet")

        expect(page).to have_content("James Hetfield")
        expect(page).to have_link("James Hetfield")

        expect(page).to have_content("Lars Ulrich")
        expect(page).to have_link("Lars Ulrich")

        # Expected actions
        expect(page).to have_link("New person")

        # Expected footer
        # TODO Create proper footer
        expect(page).to have_content("Created by Nik at 2021-05-31 13:45")
        expect(page).to have_content("Last updated by Nik at 2021-06-01 09:00")
   end

    scenario "A user tries to lists all people but there are none" do
       Person.delete_all
        visit "/"
        click_link "Event tracker"
        click_link "People"

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
        # TODO Do not expect any flash messages
        
        # Expected content
        # TODO Add header validation        
        expect(page).not_to have_content("Kirk Hammet")
        expect(page).not_to have_link("Kirk Hammet")

        expect(page).not_to have_content("James Hetfield")
        expect(page).not_to have_link("James Hetfield")

        expect(page).not_to have_content("Lars Ulrich")
        expect(page).not_to have_link("Lars Ulrich")

        within ("h1#no-people") do
            expect(page).to have_content("No people have been created")
        end
        
        # Expected actions
        expect(page).to have_link("New person")

        # Expected footer
        # TODO Create proper footer
        expect(page).to have_content("Created by Nik at 2021-05-31 13:45")
        expect(page).to have_content("Last updated by Nik at 2021-06-01 09:00")        
    end
end


rspec spec/features/event-tracker/listing_people_spec.rb 
..

Finished in 0.40292 seconds (files took 1.65 seconds to load)
2 examples, 0 failures

Developer:~/environment/MainApp (linking-event-person) $ 





