require "rails_helper"

RSpec.feature "Event tracker - Creating an event - " do

    before do
        @person1 = Person.create(first_name: "Kirk",
                                  last_name: "Hammet") 
        @person2 = Person.create(first_name: "James",
                                  last_name: "Hetfield") 
        @person3 = Person.create(first_name: "Lars",
                                  last_name: "Ulrich") 
    end
    
    scenario "A user creates a new event from a person page without uploading an image" do
        visit "/"
        click_link "Event tracker"
        click_link "People"
        click_link "Lars Ulrich"
        click_link "New event"

        fill_in "Title", with: "started Metallica"
        fill_in "Details", with: "Formed a band together with James Hetfield and named it Metallica"
        fill_in "Day", with: "1"
        fill_in "Month", with: "10"
        fill_in "Year", with: "1981"
        click_button "Create an event"

        # Expected routing
        expect(current_path).to eq(person_path(@person3)) 

        # Expected flash message
        expect(page).to have_content("Event was successfully created")

        # Expected navigation bar
        expect(page).to have_link("Home")
        # TODO Add a proper navigation bar

        # Expected content
        # TODO Add header validation
        expect(page).to have_content("Lars Ulrich")
        expect(page).to have_content("Lars Ulrich started Metallica")
        expect(page).to have_content("1981-10-01")
        
        # Expected actions
        expect(page).to have_link("Edit person")
        expect(page).to have_link("Delete person")
    end

    xscenario "A user creates a new event including uploading an image" do
   end

    scenario "A user fails to create a new event" do
        visit "/"
        click_link "Event tracker"
        click_link "Event"
        click_link "New event"

        fill_in "Title", with: ""
        fill_in "Details", with: ""
        fill_in "Day", with: ""
        fill_in "Month", with: ""
        fill_in "Year", with: ""
        click_button "Create an event"

        # Expected routing
        expect(current_path).to eq(new_person_events_path) 

        # Expected flash message
        expect(page).to have_content("1 error prohibited this event from being saved:")
        expect(page).to have_content("Title can't be blank")

        # Expected content
        # TODO Add header validation
        expect(page).to have_content("Editing person")

        # Expected actions
        expect(page).to have_selector("input[type=submit][value='Update the person']")
    end
end