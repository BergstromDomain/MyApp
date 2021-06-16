require "rails_helper"

RSpec.feature "Event tracker - Listing events - " do
    
    before do
        @blog1 = Blog.create(title: "Ruby on Rails",
                              body: "This is a blog post about Ruby on Rails") 
        @blog2 = Blog.create(title: "Travelling",
                              body: "This is a blog post about travelling") 
    end

    scenario "A user lists all blog posts" do
        visit "/"
        click_link "Blogs"

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
        # TODO No flash message

        # Expected content
        # TODO Sorting
        expect(page).to have_link("Ruby on Rails")
        expect(page).to have_content("This is a blog post about Ruby on Rails")

        expect(page).to have_link("Travelling")
        expect(page).to have_content("This is a blog post about travelling")
        
        # Expected actions
        expect(page).to have_link("New blog post")
   end

    scenario "A user tries to lists all blog posts but there are none" do
        Blog.delete_all
        visit "/"
        click_link "Blogs"

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
        # TODO No flash message

        # Expected content
        expect(page).not_to have_link("Ruby on Rails")
        expect(page).not_to have_content("This is a blog post about Ruby on Rails")

        expect(page).not_to have_link("Travelling")
        expect(page).not_to have_content("This is a blog post about travelling")

        within ("h1#no-blogs") do
            expect(page).to have_content("No blog posts have been created")
        end

        # Expected actions
        expect(page).to have_link("New blog post")
    end
end
