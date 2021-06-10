require "rails_helper"

RSpec.feature "Event tracker - Listing events - " do
    
    before do
        @person1 = Person.create(first_name: "Kirk",
                                  last_name: "Hammet") 
        @person2 = Person.create(first_name: "Lars",
                                  last_name: "Ulrich")
        @person3 = Person.create(first_name: "Robert",
                                  last_name: "Trujillo")
                                  

        @event1 = Event.create(title: "Birthday",
                                details: "Kirk Lee Hammett was born on November 18, 1962)",
                                day: "18",
                                month: "11",
                                year: "1962",
                                person_id: @person1.id)
        @event2 = Event.create(title: "Birthday",
                                details: "Lars Ulrich was born on December 26, 1963)",
                                day: "26",
                                month: "12",
                                year: "1963",
                                person_id: @person2.id)
        @event3 = Event.create(title: "Formed Metallica",
                                details: "Lars and James formed Metallica)",
                                day: "1",
                                month: "10",
                                year: "1981",
                                person_id: @person2.id)
    end


    scenario "A user lists all events" do
        visit "/"
        click_link "Event tracker"
        click_link "Events"

        # Expected routing
        expect(current_path).to eq(events_path)   

        # Expected navigation bar
        expect(page).to have_link("Home")
        expect(page).to have_link("About")   
        expect(page).to have_link("Contact")  
        expect(page).to have_link("Event tracker")      

        # Expected page title
        # TODO Add title expectaion
        expect(page).to have_content("Listing events")
        
        # Expected flash message
        # TODO No flash message

        # Expected content
        expect(page).to have_link("Kirk Hammet")
        expect(page).to have_link("Birthday")
        expect(page).to have_content("1962-11-18")

        expect(page).to have_link("Lars Ulrich")
        expect(page).to have_link("Birthday")
        expect(page).to have_content("1963-12-26")

        expect(page).to have_link("Lars Ulrich")
        expect(page).to have_link("Formed Metallica")
        expect(page).to have_content("1981-10-01")
        
        expect(page).not_to have_content("Robert Trujillo")

        # Expected actions
        # TODO New event (add person from drop down)
   end

    scenario "A user tries to lists all events but there are none" do
       Event.delete_all
        visit "/"
        click_link "Event tracker"
        click_link "Events"

        # Expected routing
        expect(current_path).to eq(events_path)   

        # Expected navigation bar
        expect(page).to have_link("Home")
        expect(page).to have_link("About")   
        expect(page).to have_link("Contact")  
        expect(page).to have_link("Event tracker")       

        # Expected page title
        # TODO Add title expectaion
        expect(page).to have_content("Listing events")
        
        # Expected flash message
        # TODO No flash message

        # Expected content
        expect(page).not_to have_link("Kirk Hammet")
        expect(page).not_to have_link("Birthday")
        expect(page).not_to have_content("1962-11-18")

        expect(page).not_to have_link("Lars Ulrich")
        expect(page).not_to have_link("Birthday")
        expect(page).not_to have_content("1963-12-26")

        expect(page).not_to have_link("Lars Ulrich")
        expect(page).not_to have_link("Formed Metallica")
        expect(page).not_to have_content("1981-10-01")

        within ("h1#no-events") do
            expect(page).to have_content("No events have been created")
        end

        # Expected actions
        # TODO New event (add person from drop down)
    end
end
