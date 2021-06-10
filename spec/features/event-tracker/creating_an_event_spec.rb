require "rails_helper"

RSpec.feature "Event tracker - Creating an event - " do
    before do
        @person1 = Person.create(first_name: "Kirk",
                                  last_name: "Hammet") 
    end    
    
    scenario "A user creates a new event without uploading an image" do
        visit "/"
        click_link "Event tracker"
        click_link "People"
        click_link "Kirk Hammet"
        click_link "New event"

        fill_in "Title", with: "Birthday"
        fill_in "Details", with: "Kirk Lee Hammett was born on November 18, 1962"
        fill_in "Day", with: "18"
        fill_in "Month", with: "11"
        fill_in "Year", with: "1962"
        click_button "Create an event"

        # Expected routing
        expect(current_path).to eq(person_event_path(@person1.id, Event.last.id))         

        # Expected navigation bar
        expect(page).to have_link("Home")
        expect(page).to have_link("About")   
        expect(page).to have_link("Contact")  
        expect(page).to have_link("Event tracker")

        # Expected page title
        # TODO Add title expectaion
        expect(page).to have_content("Kirk Hammet - Birthday")

        # Expected flash message
        expect(page).to have_content("Flash message")
        expect(page).to have_content("Birthday was successfully created")

        # Expected page content
        # TODO Add header expectaion
        expect(page).to have_content("Kirk Lee Hammett was born on November 18, 1962")
        expect(page).to have_content("1962-11-18")

        # Expected actions
        expect(page).to have_link("Edit event")
        expect(page).to have_link("Delete event")
        expect(page).to have_link("Back")
    end

    scenario "A user fails to create a new event" do
        visit "/"
        click_link "Event tracker"
        click_link "People"
        click_link "Kirk Hammet"
        click_link "New event"

        fill_in "Title", with: ""
        fill_in "Details", with: ""
        fill_in "Day", with: ""
        fill_in "Month", with: ""
        fill_in "Year", with: ""
        click_button "Create an event"

        # Expected routing
        expect(current_path).to eq(person_events_path(@person1))         

        # Expected navigation bar
        expect(page).to have_link("Home")
        expect(page).to have_link("About")   
        expect(page).to have_link("Contact")  
        expect(page).to have_link("Event tracker")

        # Expected page title
        # TODO Add title expectaion
        expect(page).to have_content("Kirk Hammet - New event")

        # Expected flash message
        expect(page).to have_content("Flash message")
        expect(page).to have_content("4 errors prohibited this event from being saved:")
        expect(page).to have_content("Title can't be blank")
        expect(page).to have_content("Year can't be blank")
        expect(page).to have_content("Month can't be blank")
        expect(page).to have_content("Day can't be blank")

        # Expected page content
        # TODO Add header expectaion
        expect(page).to have_content("Title")
        expect(page).to have_content("Details")
        expect(page).to have_content("Day")
        expect(page).to have_content("Month")
        expect(page).to have_content("Year")
        expect(page).to have_content("Main image")
        expect(page).not_to have_content("Thumb image")
        
        # Expected actions
        expect(page).to have_selector("input[type=submit][value='Create an event']")
        expect(page).to have_link("Cancel")
    end

    xscenario "A user creates a new event including uploading an image" do
   end
end