require "rails_helper"

RSpec.feature "Blogs - Showing a blog post - " do
    
    before do
        @blog1 = Blog.create(title: "Ruby on Rails",
                              body: "This is a blog post about Ruby on Rails") 
        @blog2 = Blog.create(title: "Travelling",
                              body: "This is a blog post about travelling") 
    end
                                  
    scenario "A user shows a blog post" do
        visit "/"
        click_link "Blogs"
        click_link "Ruby on Rails"

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
        expect(page).to have_content("Ruby on Rails")
        
        # Expected flash message
        # TODO No flash message
        
        # Expected content
        expect(page).to have_content("This is a blog post about Ruby on Rails")

        # Expected actions
        expect(page).to have_link("Edit blog post")
        expect(page).to have_link("Publish blog post")
        expect(page).to have_link("Delete blog post")
        expect(page).to have_link("Back")
   end

    xscenario "A user shows a blog post with an uploaded image" do
    end

    xscenario "A user tries to visit a blog post that doesn't exist" do
    end
end
