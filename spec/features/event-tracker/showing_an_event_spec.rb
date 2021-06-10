require "rails_helper"

RSpec.feature "Event tracker - Showing an event - " do
    
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
                                
    scenario "A user selects an event from a person and shows it" do
        visit "/"
        click_link "Event tracker"
        click_link "People"
        click_link "Lars Ulrich"
        click_link "Birthday"
        
        # Expected routing
        expect(current_path).to eq(person_event_path(@person2.id, @event2.id))

        # Expected navigation bar
        # TODO Add a proper navigation bar
        expect(page).to have_content("Navigation")
        expect(page).to have_link("Home")
        expect(page).to have_link("Event tracker") 
        
        # Expected page title
        # TODO Add title expectaion
        expect(page).to have_content("Lars Ulrich - Birthday")
        
        # Expected flash message
        # TODO No flash message
        
        # Expected content
        expect(page).to have_content("Lars Ulrich was born on December 26, 1963")
        expect(page).to have_content("1963-12-26")

        # Expected actions
        expect(page).to have_link("Edit event")
        expect(page).to have_link("Delete event")
        expect(page).to have_link("Back")
   end

    scenario "A user selects an event from the events listing and shows it" do
        visit "/"
        click_link "Event tracker"
        click_link "Event"
        click_link "Formed Metallica"
        
        # Expected routing
        expect(current_path).to eq(person_event_path(@person2, @event3))

        # Expected navigation bar
        # TODO Add a proper navigation bar
        expect(page).to have_content("Navigation")
        expect(page).to have_link("Home")
        expect(page).to have_link("Event tracker") 
        
        # Expected page title
        # TODO Add title expectaion
        expect(page).to have_content("Lars Ulrich - Formed Metallica")
        
        # Expected flash message
        # TODO No flash message
        
        # Expected content
        expect(page).to have_content("Lars and James formed Metallica")
        expect(page).to have_content("1981-10-01")

        # Expected actions
        expect(page).to have_link("Edit event")
        expect(page).to have_link("Delete event")
        expect(page).to have_link("Back")
   end

    xscenario "A user shows an event with an uploaded image" do
    end
end
