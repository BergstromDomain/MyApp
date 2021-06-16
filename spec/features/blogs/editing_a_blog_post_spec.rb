require "rails_helper"

RSpec.feature "Blogs - Editing a blog post - " do

    before do
        @blog1 = Blog.create(title: "Ruby on Rails",
                              body: "This is a blog post about Ruby on Rails") 
        @blog2 = Blog.create(title: "Travelling",
                              body: "This is a blog post about travelling") 
    end

    scenario "A user updates a blog post" do
        visit "/"
        click_link "Blogs"
        click_link "Ruby on Rails"
        click_link "Edit blog post"

        fill_in "Title", with: "Learning Rails"
        fill_in "Body", with: "This is a blog post about learning Rails"
        click_button "Update the blog post"

        # Expected routing
        expect(current_path).to eq(blog_path(@blog1))
        
        # Expected navigation bar
        expect(page).to have_link("Home")
        expect(page).to have_link("About")   
        expect(page).to have_link("Contact")  
        expect(page).to have_link("Event tracker")      
        expect(page).to have_link("Blogs")      

        # Expected page title
        # TODO Add title expectaion
        expect(page).to have_content("Learning Rails")
        
        # Expected flash message
        expect(page).to have_content("The blog post Learning Rails was successfully updated.")

        # Expected content
        # TODO Add header validation
        expect(page).to have_content("This is a blog post about learning Rails")

        # Expected actions
        expect(page).to have_link("Edit blog post")
        expect(page).to have_link("Publish blog post")
        expect(page).to have_link("Delete blog post")
        expect(page).to have_link("Back")
        
        # Expected footer
        # TODO Create proper footer
        expect(page).to have_content("Created by Nik at 2021-05-31 13:45")
        expect(page).to have_content("Last updated by Nik at 2021-06-01 09:00")
    end

    scenario "A user fails to update a blog post" do
        visit "/"
        click_link "Blogs"
        click_link "Ruby on Rails"
        click_link "Edit blog post"

        fill_in "Title", with: ""
        fill_in "Body", with: ""
        click_button "Update the blog post"
        
         # Expected routing
        expect(current_path).to eq(blog_path(@blog1))
        
        # Expected navigation bar
        expect(page).to have_link("Home")
        expect(page).to have_link("About")   
        expect(page).to have_link("Contact")  
        expect(page).to have_link("Event tracker")      
        expect(page).to have_link("Blogs")      

        # Expected page title
        # TODO Add title expectaion
        expect(page).to have_content("Editing")
        
        # Expected flash message
        expect(page).to have_content("1 error prohibited this blog post from being saved:")
        expect(page).to have_content("Title can't be blank")

        # Expected content
        # TODO Add header validation
        expect(page).to have_content("Title")
        expect(page).to have_content("Body")

        # Expected actions
        expect(page).to have_selector("input[type=submit][value='Update the blog post']")
        expect(page).to have_link("Cancel")
        
        # Expected footer
        # TODO Create proper footer
        expect(page).to have_content("Created by Nik at 2021-05-31 13:45")
        expect(page).to have_content("Last updated by Nik at 2021-06-01 09:00")
    end
end