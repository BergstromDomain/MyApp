require "rails_helper"

RSpec.feature "Event tracker - Deleting an event - " do
    
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

    scenario "A user deletes an event" do
        visit "/"
        click_link "Event tracker"
        click_link "Events"
        click_link "Kirk Hammet's birthday"
        click_link "Delete event"

        # Expected flash message
        expect(page).to have_content("Event was successfully deleted")

        # Expected content
        expect(page).not_to have_content("Kirk Hammet's birthday")

        # Expected navigation

        # Expected path
        expect(current_path).to eq(events_path) 
   end
end