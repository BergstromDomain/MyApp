require "rails_helper"

RSpec.feature "Event tracker - Creating an event - " do
    scenario "A user creates a new event without uploading an image" do
        visit "/"
        click_link "Event tracker"
        click_link "Event"
        click_link "New event"

        fill_in "Title", with: "Niklas Bergstrom's Birthday"
        fill_in "Details", with: "Niklas was born in Stockholm on 17 February 1974"
        fill_in "Day", with: "17"
        fill_in "Month", with: "2"
        fill_in "Year", with: "1974"
        click_button "Create an event"

        expect(page).to have_content("Event was successfully created")
        expect(current_path).to eq(event_path(Event.last.id)) 
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

        expect(page).to have_content("1 error prohibited this event from being saved:")
        expect(page).to have_content("Title can't be blank")
        expect(current_path).to eq(events_path) 
    end
end