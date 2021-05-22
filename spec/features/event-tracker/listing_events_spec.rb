require "rails_helper"

RSpec.feature "Event tracker - Listing events - " do
    
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

    scenario "A user lists all events" do
        visit "/"
        click_link "Event tracker"
        click_link "Events"

        # Expected flash message

        # Expected content
        expect(page).to have_content("Kirk Hammet's birthday")
        expect(page).to have_link("Kirk Hammet's birthday")
        expect(page).to have_content("1962-11-18")

        expect(page).to have_content("James Hetfield's birthday")
        expect(page).to have_link("James Hetfield's birthday")
        expect(page).to have_content("1963-08-03")

        expect(page).to have_content("Lars Ulrich's birthday")
        expect(page).to have_link("Lars Ulrich's birthday")
        expect(page).to have_content("1963-12-26")

        # Expected navigation

        # Expected path
   end

    scenario "A user tries to lists all events but there are none" do
       Event.delete_all
        visit "/"
        click_link "Event tracker"
        click_link "Events"

        # Expected flash message

        # Expected content
        expect(page).not_to have_content("Kirk Hammet's birthday")
        expect(page).not_to have_link("Kirk Hammet's birthday")
        expect(page).not_to have_content("1962-11-18")

        expect(page).not_to have_content("James Hetfield's birthday")
        expect(page).not_to have_link("James Hetfield's birthday")
        expect(page).not_to have_content("1962-08-03")

        expect(page).not_to have_content("Lars Ulrich's birthday")
        expect(page).not_to have_link("Lars Ulrich's birthday")
        expect(page).not_to have_content("1962-12-26")

        within ("h1#no-events") do
            expect(page).to have_content("No events have been created")
        end

        # Expected navigation

        # Expected path
    end
end
