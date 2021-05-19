require "rails_helper"

RSpec.feature "About Page - " do
    scenario "A user navigates to the about page" do
        visit "/"
        click_link "About me"

        expect(page).to have_content("About me")
        expect(page).to have_link("Home")
   end
end