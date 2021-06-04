

rspec spec/features/event-tracker/listing_people_spec.rb 
..

Finished in 0.40292 seconds (files took 1.65 seconds to load)
2 examples, 0 failures

Developer:~/environment/MainApp (linking-event-person) $ rspec spec/features/event-tracker/showing_a_person_spec.rb 
...***

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Showing a person -  A user shows a person with an uploaded image - Name entered in lowercase letters
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/showing_a_person_spec.rb:124

  2) Event tracker - Showing a person -  A user shows a person witht an uploaded image - Name entered in uppercase letters
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/showing_a_person_spec.rb:127

  3) Event tracker - Showing a person -  A user shows a person with an uploaded image - Name entered in capitalized letters
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/showing_a_person_spec.rb:130


Finished in 0.49749 seconds (files took 1.39 seconds to load)
6 examples, 0 failures, 3 pending



















### All actions 3 June

cd MainApp/
Developer:~/environment/MainApp (linking-event-person) $ rspec spec/features/event-tracker/creating_a_person_spec.rb 
F*..

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Creating a person -  A user creates a new person including uploading an image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/creating_a_person_spec.rb:47


Failures:

  1) Event tracker - Creating a person -  A user creates a new person without uploading an image
     Failure/Error: <%= link_to 'New event', new_event_path(@person) %>
     
     ActionView::Template::Error:
       undefined method `new_event_path' for #<ActionView::Base:0x000000000094c0>
       Did you mean?  new_person_event_path
     # ./app/views/people/show.html.erb:17:in `_app_views_people_show_html_erb___209937048831607322_19020'
     # <internal:kernel>:90:in `tap'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/actiontext-6.1.3.2/lib/action_text/rendering.rb:20:in `with_renderer'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/actiontext-6.1.3.2/lib/action_text/engine.rb:55:in `block (4 levels) in <class:Engine>'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/tempfile_reaper.rb:15:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/etag.rb:27:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/conditional_get.rb:27:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/head.rb:12:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/session/abstract/id.rb:266:in `context'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/session/abstract/id.rb:260:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/railties-6.1.3.2/lib/rails/rack/logger.rb:37:in `call_app'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/railties-6.1.3.2/lib/rails/rack/logger.rb:26:in `block in call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/railties-6.1.3.2/lib/rails/rack/logger.rb:26:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/method_override.rb:24:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/runtime.rb:22:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/sendfile.rb:110:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/railties-6.1.3.2/lib/rails/engine.rb:539:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/urlmap.rb:74:in `block in call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/urlmap.rb:58:in `each'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/urlmap.rb:58:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-test-1.1.0/lib/rack/mock_session.rb:29:in `request'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-test-1.1.0/lib/rack/test.rb:266:in `process_request'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-test-1.1.0/lib/rack/test.rb:129:in `custom_request'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-test-1.1.0/lib/rack/test.rb:58:in `get'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/rack_test/browser.rb:72:in `process'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/rack_test/browser.rb:56:in `block in process_and_follow_redirects'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/rack_test/browser.rb:51:in `times'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/rack_test/browser.rb:51:in `process_and_follow_redirects'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/rack_test/browser.rb:36:in `submit'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/rack_test/form.rb:43:in `submit'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/rack_test/node.rb:75:in `click'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/rack_test/node.rb:131:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/rack_test/node.rb:131:in `click'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/node/element.rb:172:in `block in click'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/node/element.rb:597:in `block in perform_click_action'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/node/base.rb:83:in `synchronize'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/node/element.rb:597:in `perform_click_action'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/node/element.rb:171:in `click'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/node/actions.rb:58:in `click_button'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/session.rb:762:in `click_button'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/dsl.rb:53:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/dsl.rb:53:in `click_button'
     # ./spec/features/event-tracker/creating_a_person_spec.rb:12:in `block (2 levels) in <top (required)>'
     # ------------------
     # --- Caused by: ---
     # NoMethodError:
     #   undefined method `new_event_path' for #<ActionView::Base:0x000000000094c0>
     #   Did you mean?  new_person_event_path
     #   ./app/views/people/show.html.erb:17:in `_app_views_people_show_html_erb___209937048831607322_19020'

Finished in 1.02 seconds (files took 1.61 seconds to load)
4 examples, 1 failure, 1 pending

Failed examples:

rspec ./spec/features/event-tracker/creating_a_person_spec.rb:4 # Event tracker - Creating a person -  A user creates a new person without uploading an image

Developer:~/environment/MainApp (linking-event-person) $ rspec spec/features/event-tracker/creating_an_event_spec.rb 
F*F

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Creating an event -  A user creates a new event including uploading an image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/creating_an_event_spec.rb:49


Failures:

  1) Event tracker - Creating an event -  A user creates a new event from a person page without uploading an image
     Failure/Error: <%= link_to 'New event', new_event_path(@person) %>
     
     ActionView::Template::Error:
       undefined method `new_event_path' for #<ActionView::Base:0x000000000093f8>
       Did you mean?  new_person_event_path
     # ./app/views/people/show.html.erb:17:in `_app_views_people_show_html_erb__1418740933200505136_18920'
     # <internal:kernel>:90:in `tap'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/actiontext-6.1.3.2/lib/action_text/rendering.rb:20:in `with_renderer'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/actiontext-6.1.3.2/lib/action_text/engine.rb:55:in `block (4 levels) in <class:Engine>'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/tempfile_reaper.rb:15:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/etag.rb:27:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/conditional_get.rb:27:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/head.rb:12:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/session/abstract/id.rb:266:in `context'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/session/abstract/id.rb:260:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/railties-6.1.3.2/lib/rails/rack/logger.rb:37:in `call_app'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/railties-6.1.3.2/lib/rails/rack/logger.rb:26:in `block in call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/railties-6.1.3.2/lib/rails/rack/logger.rb:26:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/method_override.rb:24:in `call'
Developer:~/environment/MainApp (linking-event-person) $ rspec spec/features/event-tracker/creating_an_event_spec.rb 
F*F

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Creating an event -  A user creates a new event including uploading an image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/creating_an_event_spec.rb:49


Failures:

  1) Event tracker - Creating an event -  A user creates a new event from a person page without uploading an image
     Failure/Error: <%= link_to 'New event', new_event_path(@person) %>
     
     ActionView::Template::Error:
       undefined method `new_event_path' for #<ActionView::Base:0x000000000093f8>
       Did you mean?  new_person_event_path
     # ./app/views/people/show.html.erb:17:in `_app_views_people_show_html_erb__243268116012578191_18920'
     # <internal:kernel>:90:in `tap'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/actiontext-6.1.3.2/lib/action_text/rendering.rb:20:in `with_renderer'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/actiontext-6.1.3.2/lib/action_text/engine.rb:55:in `block (4 levels) in <class:Engine>'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/tempfile_reaper.rb:15:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/etag.rb:27:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/conditional_get.rb:27:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/head.rb:12:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/session/abstract/id.rb:266:in `context'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/session/abstract/id.rb:260:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/railties-6.1.3.2/lib/rails/rack/logger.rb:37:in `call_app'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/railties-6.1.3.2/lib/rails/rack/logger.rb:26:in `block in call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/railties-6.1.3.2/lib/rails/rack/logger.rb:26:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/method_override.rb:24:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/runtime.rb:22:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/sendfile.rb:110:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/railties-6.1.3.2/lib/rails/engine.rb:539:in `call'
Developer:~/environment/MainApp (linking-event-person) $ rspec spec/features/event-tracker/creating_an_event_spec.rb 
F*F

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Creating an event -  A user creates a new event including uploading an image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/creating_an_event_spec.rb:49


Failures:

  1) Event tracker - Creating an event -  A user creates a new event from a person page without uploading an image
     Failure/Error: <%= link_to 'New event', new_event_path(@person) %>
     
     ActionView::Template::Error:
       undefined method `new_event_path' for #<ActionView::Base:0x000000000093f8>
       Did you mean?  new_person_event_path
     # ./app/views/people/show.html.erb:17:in `_app_views_people_show_html_erb__2579655777549545232_18920'
     # <internal:kernel>:90:in `tap'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/actiontext-6.1.3.2/lib/action_text/rendering.rb:20:in `with_renderer'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/actiontext-6.1.3.2/lib/action_text/engine.rb:55:in `block (4 levels) in <class:Engine>'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/tempfile_reaper.rb:15:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/etag.rb:27:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/conditional_get.rb:27:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/head.rb:12:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/session/abstract/id.rb:266:in `context'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/session/abstract/id.rb:260:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/railties-6.1.3.2/lib/rails/rack/logger.rb:37:in `call_app'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/railties-6.1.3.2/lib/rails/rack/logger.rb:26:in `block in call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/railties-6.1.3.2/lib/rails/rack/logger.rb:26:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/method_override.rb:24:in `call'
Developer:~/environment/MainApp (linking-event-person) $ rspec spec/features/event-tracker/creating_an_event_spec.rb 
F*F

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Creating an event -  A user creates a new event including uploading an image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/creating_an_event_spec.rb:49


Failures:

  1) Event tracker - Creating an event -  A user creates a new event from a person page without uploading an image
     Failure/Error: <%= form_with(model: event) do |form| %>
     
     ActionView::Template::Error:
       undefined method `events_path' for #<ActionView::Base:0x000000000094e8>
       Did you mean?  event_tracker_path
     # ./app/views/events/_form.html.erb:1:in `_app_views_events__form_html_erb___1980314171742525301_19040'
     # ./app/views/events/new.html.erb:3:in `_app_views_events_new_html_erb__1182547296863250027_19020'
Finished in 0.44801 seconds (files took 1.12 seconds to load)
3 examples, 2 failures, 1 pending

Failed examples:

rspec ./spec/features/event-tracker/creating_an_event_spec.rb:14 # Event tracker - Creating an event -  A user creates a new event from a person page without uploading an image
rspec ./spec/features/event-tracker/creating_an_event_spec.rb:52 # Event tracker - Creating an event -  A user fails to create a new event

Developer:~/environment/MainApp (linking-event-person) $ 
Developer:~/environment/MainApp (linking-event-person) $ 
Developer:~/environment/MainApp (linking-event-person) $ rspec spec/features/event-tracker/creating_an_event_spec.rb 
F*F

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Creating an event -  A user creates a new event including uploading an image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/creating_an_event_spec.rb:49


Failures:

  1) Event tracker - Creating an event -  A user creates a new event from a person page without uploading an image
     Failure/Error: <%= form_with(model: event) do |form| %>
     
     ActionView::Template::Error:
       undefined method `events_path' for #<ActionView::Base:0x000000000094c0>
       Did you mean?  event_tracker_path
     # ./app/views/events/_form.html.erb:1:in `_app_views_events__form_html_erb__1036874194406415324_19020'
     # ./app/views/events/new.html.erb:3:in `_app_views_events_new_html_erb__180924623408155242_19000'
     # <internal:kernel>:90:in `tap'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/actiontext-6.1.3.2/lib/action_text/rendering.rb:20:in `with_renderer'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/actiontext-6.1.3.2/lib/action_text/engine.rb:55:in `block (4 levels) in <class:Engine>'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/tempfile_reaper.rb:15:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/etag.rb:27:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/conditional_get.rb:27:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/head.rb:12:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/session/abstract/id.rb:266:in `context'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/session/abstract/id.rb:260:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/railties-6.1.3.2/lib/rails/rack/logger.rb:37:in `call_app'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/railties-6.1.3.2/lib/rails/rack/logger.rb:26:in `block in call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/railties-6.1.3.2/lib/rails/rack/logger.rb:26:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/method_override.rb:24:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/runtime.rb:22:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/sendfile.rb:110:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/railties-6.1.3.2/lib/rails/engine.rb:539:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/urlmap.rb:74:in `block in call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/urlmap.rb:58:in `each'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/urlmap.rb:58:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-test-1.1.0/lib/rack/mock_session.rb:29:in `request'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-test-1.1.0/lib/rack/test.rb:266:in `process_request'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-test-1.1.0/lib/rack/test.rb:129:in `custom_request'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-test-1.1.0/lib/rack/test.rb:58:in `get'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/rack_test/browser.rb:72:in `process'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/rack_test/browser.rb:47:in `process_and_follow_redirects'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/rack_test/browser.rb:42:in `follow'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/rack_test/node.rb:246:in `follow_link'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/rack_test/node.rb:72:in `click'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/rack_test/node.rb:131:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/rack_test/node.rb:131:in `click'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/node/element.rb:172:in `block in click'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/node/element.rb:597:in `block in perform_click_action'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/node/base.rb:83:in `synchronize'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/node/element.rb:597:in `perform_click_action'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/node/element.rb:171:in `click'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/node/actions.rb:42:in `click_link'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/session.rb:762:in `click_link'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/dsl.rb:53:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/dsl.rb:53:in `click_link'
     # ./spec/features/event-tracker/creating_an_event_spec.rb:19:in `block (2 levels) in <top (required)>'
     # ------------------
     # --- Caused by: ---
     # NoMethodError:
     #   undefined method `events_path' for #<ActionView::Base:0x000000000094c0>
     #   Did you mean?  event_tracker_path
     #   ./app/views/events/_form.html.erb:1:in `_app_views_events__form_html_erb__1036874194406415324_19020'

  2) Event tracker - Creating an event -  A user fails to create a new event
     Failure/Error: click_link "Event"
     
     Capybara::ElementNotFound:
       Unable to find link "Event"
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/node/finders.rb:303:in `block in synced_resolve'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/node/base.rb:83:in `synchronize'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/node/finders.rb:292:in `synced_resolve'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/node/finders.rb:53:in `find'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/node/actions.rb:42:in `click_link'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/session.rb:762:in `click_link'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/dsl.rb:53:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/dsl.rb:53:in `click_link'
     # ./spec/features/event-tracker/creating_an_event_spec.rb:55:in `block (2 levels) in <top (required)>'

Finished in 0.39605 seconds (files took 1.13 seconds to load)
3 examples, 2 failures, 1 pending

Failed examples:

rspec ./spec/features/event-tracker/creating_an_event_spec.rb:14 # Event tracker - Creating an event -  A user creates a new event from a person page without uploading an image
rspec ./spec/features/event-tracker/creating_an_event_spec.rb:52 # Event tracker - Creating an event -  A user fails to create a new event

Developer:~/environment/MainApp (linking-event-person) $ 
Developer:~/environment/MainApp (linking-event-person) $ 
Developer:~/environment/MainApp (linking-event-person) $ 
Developer:~/environment/MainApp (linking-event-person) $ 
Developer:~/environment/MainApp (linking-event-person) $ 
Developer:~/environment/MainApp (linking-event-person) $ 
Developer:~/environment/MainApp (linking-event-person) $ 
Developer:~/environment/MainApp (linking-event-person) $ 
Developer:~/environment/MainApp (linking-event-person) $ 
Developer:~/environment/MainApp (linking-event-person) $ 
Developer:~/environment/MainApp (linking-event-person) $ 
Developer:~/environment/MainApp (linking-event-person) $ 
Developer:~/environment/MainApp (linking-event-person) $ 
Developer:~/environment/MainApp (linking-event-person) $ 
Developer:~/environment/MainApp (linking-event-person) $ 
Developer:~/environment/MainApp (linking-event-person) $ 
Developer:~/environment/MainApp (linking-event-person) $ 
Developer:~/environment/MainApp (linking-event-person) $ 
Developer:~/environment/MainApp (linking-event-person) $ 
Developer:~/environment/MainApp (linking-event-person) $ 
Developer:~/environment/MainApp (linking-event-person) $ 
Developer:~/environment/MainApp (linking-event-person) $ 
Developer:~/environment/MainApp (linking-event-person) $ 
Developer:~/environment/MainApp (linking-event-person) $ 
Developer:~/environment/MainApp (linking-event-person) $ 
Developer:~/environment/MainApp (linking-event-person) $ 
Developer:~/environment/MainApp (linking-event-person) $ 
Developer:~/environment/MainApp (linking-event-person) $ 
Developer:~/environment/MainApp (linking-event-person) $ 
Developer:~/environment/MainApp (linking-event-person) $ 
Developer:~/environment/MainApp (linking-event-person) $ 
Developer:~/environment/MainApp (linking-event-person) $ 
Developer:~/environment/MainApp (linking-event-person) $ 
Developer:~/environment/MainApp (linking-event-person) $ 
Developer:~/environment/MainApp (linking-event-person) $ 
Developer:~/environment/MainApp (linking-event-person) $ 
Developer:~/environment/MainApp (linking-event-person) $ 
Developer:~/environment/MainApp (linking-event-person) $ 
Developer:~/environment/MainApp (linking-event-person) $ 
Developer:~/environment/MainApp (linking-event-person) $ 
Developer:~/environment/MainApp (linking-event-person) $ 
Developer:~/environment/MainApp (linking-event-person) $ 
Developer:~/environment/MainApp (linking-event-person) $ 
Developer:~/environment/MainApp (linking-event-person) $ rspec spec/features/event-tracker/creating_an_event_spec.rb 
F*F

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Creating an event -  A user creates a new event including uploading an image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/creating_an_event_spec.rb:49


Failures:

  1) Event tracker - Creating an event -  A user creates a new event from a person page without uploading an image
     Failure/Error: <%= link_to 'Back', events_path %>
     
     ActionView::Template::Error:
       undefined local variable or method `events_path' for #<ActionView::Base:0x000000000094e8>
       Did you mean?  event_tracker_path
     # ./app/views/events/new.html.erb:5:in `_app_views_events_new_html_erb___971186787269646656_19020'
     # <internal:kernel>:90:in `tap'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/actiontext-6.1.3.2/lib/action_text/rendering.rb:20:in `with_renderer'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/actiontext-6.1.3.2/lib/action_text/engine.rb:55:in `block (4 levels) in <class:Engine>'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/tempfile_reaper.rb:15:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/etag.rb:27:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/conditional_get.rb:27:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/head.rb:12:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/session/abstract/id.rb:266:in `context'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/session/abstract/id.rb:260:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/railties-6.1.3.2/lib/rails/rack/logger.rb:37:in `call_app'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/railties-6.1.3.2/lib/rails/rack/logger.rb:26:in `block in call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/railties-6.1.3.2/lib/rails/rack/logger.rb:26:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/method_override.rb:24:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/runtime.rb:22:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/sendfile.rb:110:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/railties-6.1.3.2/lib/rails/engine.rb:539:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/urlmap.rb:74:in `block in call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/urlmap.rb:58:in `each'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-2.2.3/lib/rack/urlmap.rb:58:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-test-1.1.0/lib/rack/mock_session.rb:29:in `request'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-test-1.1.0/lib/rack/test.rb:266:in `process_request'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-test-1.1.0/lib/rack/test.rb:129:in `custom_request'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/rack-test-1.1.0/lib/rack/test.rb:58:in `get'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/rack_test/browser.rb:72:in `process'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/rack_test/browser.rb:47:in `process_and_follow_redirects'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/rack_test/browser.rb:42:in `follow'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/rack_test/node.rb:246:in `follow_link'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/rack_test/node.rb:72:in `click'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/rack_test/node.rb:131:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/rack_test/node.rb:131:in `click'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/node/element.rb:172:in `block in click'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/node/element.rb:597:in `block in perform_click_action'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/node/base.rb:83:in `synchronize'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/node/element.rb:597:in `perform_click_action'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/node/element.rb:171:in `click'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/node/actions.rb:42:in `click_link'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/session.rb:762:in `click_link'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/dsl.rb:53:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/dsl.rb:53:in `click_link'
     # ./spec/features/event-tracker/creating_an_event_spec.rb:19:in `block (2 levels) in <top (required)>'
     # ------------------
     # --- Caused by: ---
     # NameError:
     #   undefined local variable or method `events_path' for #<ActionView::Base:0x000000000094e8>
     #   Did you mean?  event_tracker_path
     #   ./app/views/events/new.html.erb:5:in `_app_views_events_new_html_erb___971186787269646656_19020'

  2) Event tracker - Creating an event -  A user fails to create a new event
     Failure/Error: click_link "Event"
     
     Capybara::ElementNotFound:
       Unable to find link "Event"
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/node/finders.rb:303:in `block in synced_resolve'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/node/base.rb:83:in `synchronize'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/node/finders.rb:292:in `synced_resolve'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/node/finders.rb:53:in `find'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/node/actions.rb:42:in `click_link'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/session.rb:762:in `click_link'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/dsl.rb:53:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/dsl.rb:53:in `click_link'
     # ./spec/features/event-tracker/creating_an_event_spec.rb:55:in `block (2 levels) in <top (required)>'

Finished in 0.42945 seconds (files took 1.29 seconds to load)
3 examples, 2 failures, 1 pending

Failed examples:

rspec ./spec/features/event-tracker/creating_an_event_spec.rb:14 # Event tracker - Creating an event -  A user creates a new event from a person page without uploading an image
rspec ./spec/features/event-tracker/creating_an_event_spec.rb:52 # Event tracker - Creating an event -  A user fails to create a new event

Developer:~/environment/MainApp (linking-event-person) $ 
Developer:~/environment/MainApp (linking-event-person) $ rspec spec/features/event-tracker/creating_an_event_spec.rb 
F*F

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Creating an event -  A user creates a new event including uploading an image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/creating_an_event_spec.rb:49


Failures:

  1) Event tracker - Creating an event -  A user creates a new event from a person page without uploading an image
     Failure/Error: expect(page).to have_content("Lars Ulrich started Metallica")
       expected to find text "Lars Ulrich started Metallica" in "Navigation\nHome Event tracker\nLars Ulrich\nFlash message\nEvent was successfully created.\nEvents\nNew event\nActions\nEdit person | Delete person | Back\nFooter\nCreated by Nik at 2021-05-31 13:45 Last updated by Nik at 2021-06-01 09:00"
     # ./spec/features/event-tracker/creating_an_event_spec.rb:41:in `block (2 levels) in <top (required)>'

  2) Event tracker - Creating an event -  A user fails to create a new event
     Failure/Error: click_link "Event"
     
     Capybara::ElementNotFound:
       Unable to find link "Event"
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/node/finders.rb:303:in `block in synced_resolve'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/node/base.rb:83:in `synchronize'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/node/finders.rb:292:in `synced_resolve'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/node/finders.rb:53:in `find'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/node/actions.rb:42:in `click_link'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/session.rb:762:in `click_link'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/dsl.rb:53:in `call'
     # /home/ubuntu/.rvm/gems/ruby-3.0.0/gems/capybara-3.35.3/lib/capybara/dsl.rb:53:in `click_link'
     # ./spec/features/event-tracker/creating_an_event_spec.rb:55:in `block (2 levels) in <top (required)>'

Finished in 0.37329 seconds (files took 1.14 seconds to load)
3 examples, 2 failures, 1 pending

Failed examples:

rspec ./spec/features/event-tracker/creating_an_event_spec.rb:14 # Event tracker - Creating an event -  A user creates a new event from a person page without uploading an image
rspec ./spec/features/event-tracker/creating_an_event_spec.rb:52 # Event tracker - Creating an event -  A user fails to create a new event

Developer:~/environment/MainApp (linking-event-person) $ 



rspec spec/features/event-tracker/creating_an_event_spec.rb 
F*F

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Creating an event -  A user creates a new event including uploading an image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/creating_an_event_spec.rb:49


Failures:

  1) Event tracker - Creating an event -  A user creates a new event from a person page without uploading an image
     Failure/Error: <%= link_to 'New event', new_event_path(@person) %>
     
     ActionView::Template::Error:
       undefined method `new_event_path' for #<ActionView::Base:0x000000000093f8>
       Did you mean?  new_person_event_path
       
       
       
       
       
       
       Updated the controller
       
       
rspec spec/features/event-tracker/creating_an_event_spec.rb 
F*F

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Event tracker - Creating an event -  A user creates a new event including uploading an image
     # Temporarily disabled with xscenario
     # ./spec/features/event-tracker/creating_an_event_spec.rb:49


Failures:

  1) Event tracker - Creating an event -  A user creates a new event from a person page without uploading an image
     Failure/Error: <%= link_to 'New event', new_event_path(@person) %>
     
     ActionView::Template::Error:
       undefined method `new_event_path' for #<ActionView::Base:0x000000000093f8>
       Did you mean?  new_person_event_path
       
       
Updated the show event page


