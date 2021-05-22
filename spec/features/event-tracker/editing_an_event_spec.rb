require "rails_helper"

RSpec.feature "Event tracker - Editing an event - " do

    before do
        @event1 = Event.create(title: "Kirk Hammet's birthday",
                                details: "Kirk Lee Hammett was born on November 18, 1962",
                                day: "18",
                                month: "11",
                                year: "1962")
        @event2 = Event.create(title: "James Hetfield's birthday",
                                details: "James Alan Hetfield was born on August 3, 1963)",
                                day: "3",
                                month: "8",
                                year: "1963")
        @event3 = Event.create(title: "Lars Ulrich's birthday",
                                details: "Lars Ulrich was born on December 26, 1963)",
                                day: "26",
                                month: "12",
                                year: "1963")
    end

    scenario "A user updates an event without uploading a new image" do
        visit "/"
        click_link "Event tracker"
        click_link "Events"
        click_link "Kirk Hammet's birthday"
        click_link "Edit event"

        fill_in "Title", with: "Robert Trujillo's birthday"
        fill_in "Details", with: "Robert Trujillo's was born on October 23, 1964"
        fill_in "Day", with: "23"
        fill_in "Month", with: "10"
        fill_in "Year", with: "1964"

        click_button "Update the event"

        # Expected flash message
        expect(page).to have_content("Event was successfully updated")

        # Expected path
        expect(current_path).to eq(event_path(@event1)) 
    end

    scenario "A user fails to update an event" do
        visit "/"
        click_link "Event tracker"
        click_link "Events"
        click_link "James Hetfield's birthday"
        click_link "Edit event"

        fill_in "Title", with: ""
        fill_in "Details", with: ""
        fill_in "Day", with: ""
        fill_in "Month", with: ""
        fill_in "Year", with: ""

        click_button "Update the event"

        # Expected flash message
        expect(page).to have_content("1 error prohibited this event from being saved:")
        expect(page).to have_content("Title can't be blank")

        # Expected path
        expect(current_path).to eq(event_path(@event2)) 
    end

    xscenario "A user updates an event including uploading a new image" do
   end

    xscenario "A user updates an event and removes the uploaded image" do
   end

end