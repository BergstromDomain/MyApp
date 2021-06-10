require "rails_helper"

RSpec.feature "Contact Page - " do
    scenario "A user navigates to the contact page" do
        visit "/"
        click_link "Contact"

        # Expected routing
        expect(current_path).to eq(contact_path()) 

        # Expected navigation bar
        expect(page).to have_link("Home")
        expect(page).to have_link("About")   
        expect(page).to have_link("Contact")  
        expect(page).to have_link("Event tracker")

        # Expected page title
        # TODO Add title expectaion
        expect(page).to have_content("Contact me")

        # Expected flash message
        # No flash

        # Expected page content

        # Expected actions

        # Expected footer
        # TODO Create proper footer
        expect(page).to have_content("Created by Nik at 2021-05-31 13:45")
        expect(page).to have_content("Last updated by Nik at 2021-06-01 09:00")
   end
end