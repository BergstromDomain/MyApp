require "rails_helper"

RSpec.feature "Event tracker - Showing an event - " do
    
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

    scenario "A user shows an event without an uploaded image" do
        visit "/"
        click_link "Event tracker"
        click_link "Event"
        click_link "James Hetfield's birthday"
        
        # Expected content
        expect(page).to have_content("James Hetfield's birthday")
        expect(page).to have_content("James Alan Hetfield was born on August 3, 1963")
        expect(page).to have_content("1963-08-03")

        # Expected navigation
        expect(page).to have_link("Edit event")
        expect(page).to have_link("Back")
        expect(page).to have_link("Home")

        # Expected path
        expect(current_path).to eq(event_path(@event2))
   end

    xscenario "A user shows an event with an uploaded image" do
    end

end
