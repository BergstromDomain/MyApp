require "rails_helper"

RSpec.feature "Event Tracker - Showing a person - " do
    
    before do
        @person1 = Person.create(first_name: "kirk",
                                  last_name: "hammet") 
        @person2 = Person.create(first_name: "JAMES",
                                  last_name: "HETFIELD") 
        @person3 = Person.create(first_name: "Lars",
                                  last_name: "Ulrich")

        @event1 = Event.create(title: "James Hetfield's birthday",
                                details: "James Alan Hetfield was born on August 3, 1963)",
                                day: "3",
                                month: "8",
                                year: "1963",
                                person_id: @person2.id)
        @event2 = Event.create(title: "Lars Ulrich's birthday",
                                details: "Lars Ulrich was born on December 26, 1963)",
                                day: "26",
                                month: "12",
                                year: "1963",
                                person_id: @person3.id)
        @event3 = Event.create(title: "Formed Metallica",
                                details: "Lars and James formed Metallica)",
                                day: "1",
                                month: "10",
                                year: "1981",
                                person_id: @person3.id)
    end
    
    scenario "A user shows a person without any events" do
        visit "/"
        click_link "Event tracker"
        click_link "People"
        click_link "Kirk Hammet"

        # Expected routing
        expect(current_path).to eq(person_path(@person1))

        # Expected navigation bar
        # TODO Add a proper navigation bar
        expect(page).to have_content("Navigation")
        expect(page).to have_link("Home")
        expect(page).to have_link("Event tracker")

        # Expected page title
        # TODO Add title expectaion
        expect(page).to have_content("Kirk Hammet")

        # Expected flash message
        # TODO Do not expect any flash messages
        
        # Expected page content
        # TODO Add header expectaion
        expect(page).to have_content("Events")
        expect(page).to have_content("Kirk does not have any events")

        expect(page).to have_link("New event")

        # Expected actions
        expect(page).to have_link("Edit person")
        expect(page).to have_link("Delete person")
        expect(page).to have_link("Back")

        # Expected footer
        # TODO Create proper footer
        expect(page).to have_content("Created by Nik at 2021-05-31 13:45")
        expect(page).to have_content("Last updated by Nik at 2021-06-01 09:00")
    end
    
    scenario "A user shows a person with one event" do
        visit "/"
        click_link "Event tracker"
        click_link "People"
        click_link "James Hetfield"

        # Expected routing
        expect(current_path).to eq(person_path(@person2))

        # Expected navigation bar
        # TODO Add a proper navigation bar
        expect(page).to have_content("Navigation")
        expect(page).to have_link("Home")
        expect(page).to have_link("Event tracker")

        # Expected page title
        # TODO Add title expectaion
        expect(page).to have_content("James Hetfield")

        # Expected flash message
        # TODO Do not expect any flash messages
        
        # Expected page content
        # TODO Add header expectaion
        expect(page).to have_content("Events")
        expect(page).to have_content("James Hetfield's birthday")
        expect(page).to have_content("1963-08-03")
        expect(page).to have_link("New event")

        # Expected actions
        expect(page).to have_link("Edit person")
        expect(page).to have_link("Delete person")
        expect(page).to have_link("Back")

        # Expected footer
        # TODO Create proper footer
        expect(page).to have_content("Created by Nik at 2021-05-31 13:45")
        expect(page).to have_content("Last updated by Nik at 2021-06-01 09:00")
    end

    scenario "A user shows a person with multiple events" do
        visit "/"
        click_link "Event tracker"
        click_link "People"
        click_link "Lars Ulrich"

        # Expected routing
        expect(current_path).to eq(person_path(@person3))

        # Expected navigation bar
        # TODO Add a proper navigation bar
        expect(page).to have_content("Navigation")
        expect(page).to have_link("Home")
        expect(page).to have_link("Event tracker")

        # Expected page title
        # TODO Add title expectaion
        expect(page).to have_content("Lars Ulrich")

        # Expected flash message
        # TODO Do not expect any flash messages
        
        # Expected page content
        # TODO Add header expectaion
        expect(page).to have_content("Events")
        expect(page).to have_content("Lars Ulrich's birthday")
        expect(page).to have_content("1963-12-26")
        expect(page).to have_content("Formed Metallica")
        expect(page).to have_content("1981-10-01")
        expect(page).to have_link("New event")

        # Expected actions
        expect(page).to have_link("Edit person")
        expect(page).to have_link("Delete person")
        expect(page).to have_link("Back")

        # Expected footer
        # TODO Create proper footer
        expect(page).to have_content("Created by Nik at 2021-05-31 13:45")
        expect(page).to have_content("Last updated by Nik at 2021-06-01 09:00")
    end

    scenario "A user shows a person - Name entered in lowercase letters" do
        visit "/"
        click_link "Event tracker"
        click_link "People"
        click_link "Kirk Hammet"

        # Expected routing
        expect(current_path).to eq(person_path(@person1))

        # Expected page title
        # TODO Add title expectaion
        expect(page).to have_content("Kirk Hammet")
   end
   
    scenario "A user shows a person - Name entered in uppercase letters" do
        visit "/"
        click_link "Event tracker"
        click_link "People"
        click_link "James Hetfield"

        # Expected routing
        expect(current_path).to eq(person_path(@person2))

        # Expected page title
        # TODO Add title expectaion
        expect(page).to have_content("James Hetfield")
   end

    scenario "A user shows a person - Name entered in capitalized letters" do
        visit "/"
        click_link "Event tracker"
        click_link "People"
        click_link "Lars Ulrich"

        # Expected routing
        expect(current_path).to eq(person_path(@person3))

        # Expected page title
        # TODO Add title expectaion
        expect(page).to have_content("Lars Ulrich")
   end

    xscenario "A user shows a person without an uploaded image" do
    end

    xscenario "A user shows a person with an uploaded image" do
    end
end
