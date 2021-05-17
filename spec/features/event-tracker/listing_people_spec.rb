require "rails_helper"

RSpec.feature "Event tracker - Listing people - " do
    
    before do
        @person1 = Person.create(first_name: "James",
                                  last_name: "Hetfield") 
        @person2 = Person.create(first_name: "Lars",
                                  last_name: "Ulrich") 
    end
    
    scenario "A user lists all people" do
        visit "/"
        click_link "Event tracker"
        click_link "People"

        expect(page).to have_content(@person1.first_name)
        expect(page).to have_content(@person1.last_name)
        expect(page).to have_link("#{@person1.first_name} #{@person1.last_name}")

        expect(page).to have_content(@person2.first_name)
        expect(page).to have_content(@person2.last_name)
        expect(page).to have_link("#{@person2.first_name} #{@person2.last_name}")
   end

    scenario "A user tries to lists all people but there are none" do
       Person.delete_all
        visit "/"
        click_link "Event tracker"
        click_link "People"

        expect(page).not_to have_content(@person1.first_name)
        expect(page).not_to have_content(@person1.last_name)
        expect(page).not_to have_link("#{@person1.first_name} #{@person1.last_name}")

        expect(page).not_to have_content(@person2.first_name)
        expect(page).not_to have_content(@person2.last_name)
        expect(page).not_to have_link("#{@person2.first_name} #{@person2.last_name}")

        within ("h1#no-people") do
            expect(page).to have_content("No people have been created")
        end
    end
end