require "rails_helper"

RSpec.feature "Contact Page - " do
    scenario "A user navigates to the contact page" do
        visit "/"
        click_link "Contact Me"

        expect(page).to have_content("Contact Me")
        expect(page).to have_link("Home")
   end
end