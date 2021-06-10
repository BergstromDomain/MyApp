require "rails_helper"

RSpec.feature "Event tracker - Deleting an event - " do
    
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
                                details: "Lars and James formed Metallica",
                                day: "1",
                                month: "10",
                                year: "1981",
                                person_id: @person2.id)
    end

    scenario "A user deletes an event" do
        visit "/"
        click_link "Event tracker"
        click_link "People"
        click_link "Lars Ulrich"
        click_link "Birthday"
        click_link "Delete event"

        # Expected routing
        expect(current_path).to eq(person_path(@person2))

        # Expected navigation bar
        expect(page).to have_link("Home")
        expect(page).to have_link("About")   
        expect(page).to have_link("Contact")  
        expect(page).to have_link("Event tracker")
        
        # Expected page title
        # TODO Add title expectaion
        expect(page).to have_content("Lars Ulrich")
        
        # Expected flash message
        expect(page).to have_content("Event was successfully deleted")
        
        # Expected content
        # TODO Add header validation
        expect(page).not_to have_content("Birthday")
        expect(page).to have_content("New event")

        # Expected actions
        expect(page).to have_link("Edit person")
        expect(page).to have_link("Delete person")
        expect(page).to have_link("Back")

        # Expected footer
        # TODO Create proper footer
        expect(page).to have_content("Created by Nik at 2021-05-31 13:45")
        expect(page).to have_content("Last updated by Nik at 2021-06-01 09:00")
   end
end