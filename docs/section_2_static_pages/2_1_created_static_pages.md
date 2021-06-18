# How I developed this Ruby on Rails application #


## Static pages ##


### Created static pages ###
I will have a few static pages on my site. This pages I created in this section was just the bare minimum to get me started and I plan to add more content as my site grows.


#### Created a feature branch ####
I created a feature branch from which the static pages were developed.
```bash
git checkout -b static-pages
```


#### Developed the test for the about page ####
I create a new folder for my RSpec feature tests and I created my first spec.
```bash
mkdir spec/features
mkdir spec/features/static-pages
gedit spec/features/static-pages/about_page_spec.rb
```

```ruby
require "rails_helper"

RSpec.feature "About Page - " do
    scenario "A user navigates to the about page" do
        visit "/"
        click_link "About Me"

        expect(page).to have_content("About Me")
        expect(page).to have_link("Home")
   end
end
```

When I ran the spec it gave me the first error.
```bash
rspec spec/features/static-pages/about_page_spec.rb
F

Failures:

  1) About Page -  A user navigates to the about page
     Failure/Error: visit "/"

     ActionController::RoutingError:
       No route matches [GET] "/"
```


#### Generated a controller ####
To solve this, I generate a __Pages__ controller and created a *home*, an *about* and a *contact* page.
```bash
rails g controller Pages home about contact
```

I updated the __config/routes.rb__ file to include the new pages.
```ruby
Rails.application.routes.draw do
  root to: 'pages#home'

  get 'home', to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
end
```

When I re-ran the spec it gave me the next error.
```bash
rspec spec/features/static-pages/about_page_spec.rb
F

Failures:

  1) About Page -  A user navigates to the about page
     Failure/Error: click_link "About Me"

     Capybara::ElementNotFound:
       Unable to find link "About Me"
```


#### Added a link to the home page ####
To solve this, I added an links from the home page, `app/views/pages/home.html.erb`

```ruby
<%= link_to "About Me", about_path %>
<%= link_to "Contact Me", contact_path %>
```

When I re-ran the spec it gave me the next error.
```bash
rspec spec/features/static-pages/about_page_spec.rb
F

Failures:

  1) About Page -  A user navigates to the about page
     Failure/Error: expect(page).to have_content("About Me")
       expected to find text "About Me" in "Pages#about\nFind me in app/views/pages/about.html.erb"
```


#### Added title to the about page ####
To solve this, I updated the about page, `app/views/pages/about.html.erb` and added a title.

```ruby
<h1>About Me</h1>
```

When I re-ran the spec it gave me the next error.
```bash
rspec spec/features/static-pages/about_page_spec.rb
F

Failures:

  1) About Page -  A user navigates to the about page
     Failure/Error: expect(page).to have_link("Home")
       expected to find link "Home" but there were no matches
```


#### Added link to the home page from the about page ####
To solve this, I added a home link from the about page.
```ruby
<%= link_to "Home", root_path %>
```

When I re-ran the spec it now worked as expected.
```bash
rspec spec/features/static-pages/about_page_spec.rb
.

Finished in 0.12668 seconds (files took 0.8928 seconds to load)
1 example, 0 failures
```


#### Develop the test for the contact page ####
I followed the same steps as before and I created the feature test, `spec/features/contact_page_spec.rb`.

```ruby
require "rails_helper"

RSpec.feature "Contact Page - " do
    scenario "A user navigates to the contact page" do
        visit "/"
        click_link "Contact Me"

        expect(page).to have_content("Contact Me")
        expect(page).to have_link("Home")
   end
end
```


#### Updated the contact page ####
I updated the contact page and added a title and link back to the home page.


#### Added link to the home page from the contact page ####
I added a home link from the contact page.


#### Committed the changes ####
Before I committed any changes I made sure that all existing tests passed.
```bash
rspec spec/features/static-pages/
..

Finished in 0.22302 seconds (files took 1.07 seconds to load)
2 examples, 0 failures
```

I checked the git status before I committed my changes.
```bash
git status
git add -A
git commit -m "Static pages - Created the home, contact and about pages"
git push origin static-pages
```


#### Merged the changes to the main branch ####
Finally I merged the static pages back into the main branch.
```bash
git checkout main 
git merge static-pages
git push origin main
```


----------
[<< Previous Chapter](../section_2_static_pages/2_0_static_pages_toc.md) | [Table Of Contents](../how_i_developed_this_rails_application.md) | Next Chapter >>