require "rails_helper"

RSpec.feature "Event tracker - Editing an event - " do

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
    
    scenario "A user updates an event without uploading a new image" do
        visit "/"
        click_link "Event tracker"
        click_link "Events"
        click_link "Formed Metallica"
        click_link "Edit event"
        
        fill_in "Title", with: "Metallica was created"
        fill_in "Details", with: "Lars and James created Metallica"
        fill_in "Day", with: "30"
        fill_in "Month", with: "10"
        fill_in "Year", with: "1981"
        click_button "Update the event"

        # Expected routing
        expect(current_path).to eq(person_event_path(@person2.id, @event3.id))

        # Expected navigation bar
        expect(page).to have_link("Home")
        expect(page).to have_link("About")   
        expect(page).to have_link("Contact")  
        expect(page).to have_link("Event tracker")

        # Expected page title
        # TODO Add title expectaion
        expect(page).to have_content("Lars Ulrich - Metallica was created")

        # Expected flash message
        expect(page).to have_content("The event was successfully updated to Metallica was created")

        # Expected content
        expect(page).to have_content("Lars and James created Metallica")
        expect(page).to have_content("1981-10-30")

        # Expected actions
        expect(page).to have_link("Edit event")
        expect(page).to have_link("Delete event")
        expect(page).to have_link("Back")
    end

    scenario "A user fails to update an event" do
        visit "/"
        click_link "Event tracker"
        click_link "People"
        click_link "Kirk Hammet"
        click_link "Birthday"
        click_link "Edit event"

        fill_in "Title", with: ""
        fill_in "Details", with: ""
        fill_in "Day", with: ""
        fill_in "Month", with: ""
        fill_in "Year", with: ""
        click_button "Update the event"

        # Expected routing
        expect(current_path).to eq(person_event_path(@person1.id, @event1.id))

        # Expected navigation bar
        expect(page).to have_link("Home")
        expect(page).to have_link("About")   
        expect(page).to have_link("Contact")  
        expect(page).to have_link("Event tracker")

        # Expected page title
        # TODO Add title expectaion
        expect(page).to have_content("Kirk Hammet -")

        # Expected flash message
        expect(page).to have_content("4 errors prohibited this event from being saved:")
        expect(page).to have_content("Title can't be blank")
        expect(page).to have_content("Year can't be blank")
        expect(page).to have_content("Month can't be blank")
        expect(page).to have_content("Day can't be blank")

        # Expected content
        expect(page).to have_content("Title")
        expect(page).to have_content("Details")
        expect(page).to have_content("Day")
        expect(page).to have_content("Month")
        expect(page).to have_content("Year")
        expect(page).to have_content("Main image")
        expect(page).not_to have_content("Thumb image")

        # Expected actions
        expect(page).to have_selector("input[type=submit][value='Update the event']")
        expect(page).to have_link("Cancel")
    end

    xscenario "A user updates an event including uploading a new image" do
   end

    xscenario "A user updates an event and removes the uploaded image" do
   end

end