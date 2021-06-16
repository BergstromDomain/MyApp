require "rails_helper"

RSpec.feature "Blogs - Creating a blog post - " do
    scenario "A user creates a new blog post" do
        visit "/"
        click_link "Blogs"
        click_link "New blog post"

        fill_in "Title", with: "My first blog"
        fill_in "Body", with: "This is my first blog."
        click_button "Create a blog post"

        # Expected routing
        expect(current_path).to eq(blog_path(Blog.last.id))

        # Expected navigation bar
        expect(page).to have_link("Home")
        expect(page).to have_link("About")
        expect(page).to have_link("Contact")
        expect(page).to have_link("Event tracker")
        expect(page).to have_link("Blogs")

        # Expected page title
        # TODO Add title expectaion
        expect(page).to have_content("My first blog")

        # Expected flash message
        expect(page).to have_content("Flash message")
        expect(page).to have_content("My first blog was successfully created")

        # Expected page content
        # TODO Add header expectaion
        expect(page).to have_content("This is my first blog.")

        # Expected actions
        expect(page).to have_link("Edit blog post")
        expect(page).to have_link("Publish blog post")
        expect(page).to have_link("Delete blog post")

        # Expected footer
        # TODO Create proper footer
        expect(page).to have_content("Created by Nik at 2021-05-31 13:45")
        expect(page).to have_content("Last updated by Nik at 2021-06-01 09:00")
    end

    scenario "A user fails to create a new blog post" do
        visit "/"
        click_link "Blogs"
        click_link "New blog post"

        fill_in "Title", with: ""
        fill_in "Body", with: ""
        click_button "Create a blog post"

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
        expect(page).to have_content("New blog post")

        # Expected flash message
        expect(page).to have_content("1 error prohibited this blog post from being saved:")
        expect(page).to have_content("Title can't be blank")

        # Expected content
        expect(page).to have_content("Title")
        expect(page).to have_content("Body")

        # Expected actions
        expect(page).to have_selector("input[type=submit][value='Create a blog post']")
        expect(page).to have_link("Cancel")

        # Expected footer
        # TODO Create proper footer
        expect(page).to have_content("Created by Nik at 2021-05-31 13:45")
        expect(page).to have_content("Last updated by Nik at 2021-06-01 09:00")
    end

    scenario "A user cancels the creation of a new blog post" do
        visit "/"
        click_link "Blogs"
        click_link "New blog post"

        fill_in "Title", with: "My second blog"
        fill_in "Body", with: "This is my second blog."
        click_link "Cancel"

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
        # TODO Add expectation for no flash message

        # Expected content
        expect(page).not_to have_content("My second blog")

        # Expected actions
        expect(page).to have_link("New blog post")

        # Expected footer
        # TODO Create proper footer
        expect(page).to have_content("Created by Nik at 2021-05-31 13:45")
        expect(page).to have_content("Last updated by Nik at 2021-06-01 09:00")
    end
end
