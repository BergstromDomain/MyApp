require "rails_helper"

RSpec.feature "Blogs - Deleting a blog post - " do
    
    before do
        @blog1 = Blog.create(title: "Ruby on Rails",
                              body: "This is a blog post about Ruby on Rails") 
        @blog2 = Blog.create(title: "Travelling",
                              body: "This is a blog post about travelling") 
    end
                                  

    scenario "A user deletes a blog post" do
        visit "/"
        click_link "Blogs"
        click_link "Ruby on Rails"
        click_link "Delete blog post"

        # Expected routing
        expect(current_path).to eq(blogs_path)

        # Expected navigation bar
        expect(page).to have_link("Home")
        expect(page).to have_link("About")   
        expect(page).to have_link("Contact")  
        expect(page).to have_link("Event tracker")
        expect(page).to have_link("Blogs")
        
        # Expected page title
        # TODO Add title expectaion
        expect(page).to have_content("Listing blog posts")
        
        # Expected flash message
        expect(page).to have_content("Blog post was successfully deleted")
        
        # Expected content
        # TODO Add header validation
        expect(page).not_to have_content("Ruby on Rails")
        expect(page).not_to have_content("This is a blog post about Ruby on Rails")

        # Expected actions
        expect(page).to have_link("New blog post")

        # Expected footer
        # TODO Create proper footer
        expect(page).to have_content("Created by Nik at 2021-05-31 13:45")
        expect(page).to have_content("Last updated by Nik at 2021-06-01 09:00")
   end
end