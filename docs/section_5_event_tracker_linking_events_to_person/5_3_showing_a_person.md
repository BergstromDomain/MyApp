rails g migration add_person_reference_to_events person:references
Running via Spring preloader in process 9101
      invoke  active_record
      create    db/migrate/20210522105100_add_person_reference_to_events.rb
Developer:~/environment/MainApp (linking-event-person) $ 


rails db:migrate
== 20210522105100 AddPersonReferenceToEvents: migrating =======================
-- add_reference(:events, :person, {:null=>false, :foreign_key=>true})
rails aborted!
StandardError: An error has occurred, this and all later migrations canceled:

PG::NotNullViolation: ERROR:  column "person_id" contains null values
/home/ubuntu/environment/MainApp/db/migrate/20210522105100_add_person_reference_to_events.rb:3:in `change'
/home/ubuntu/environment/MainApp/bin/rails:5:in `<top (required)>'
/home/ubuntu/environment/MainApp/bin/spring:10:in `block in <top (required)>'
/home/ubuntu/environment/MainApp/bin/spring:7:in `<top (required)>'

Caused by:
ActiveRecord::NotNullViolation: PG::NotNullViolation: ERROR:  column "person_id" contains null values
/home/ubuntu/environment/MainApp/db/migrate/20210522105100_add_person_reference_to_events.rb:3:in `change'
/home/ubuntu/environment/MainApp/bin/rails:5:in `<top (required)>'
/home/ubuntu/environment/MainApp/bin/spring:10:in `block in <top (required)>'
/home/ubuntu/environment/MainApp/bin/spring:7:in `<top (required)>'

Caused by:
PG::NotNullViolation: ERROR:  column "person_id" contains null values
/home/ubuntu/environment/MainApp/db/migrate/20210522105100_add_person_reference_to_events.rb:3:in `change'
/home/ubuntu/environment/MainApp/bin/rails:5:in `<top (required)>'
/home/ubuntu/environment/MainApp/bin/spring:10:in `block in <top (required)>'
/home/ubuntu/environment/MainApp/bin/spring:7:in `<top (required)>'
Tasks: TOP => db:migrate
(See full trace by running task with --trace)
Developer:~/environment/MainApp (linking-event-person) $ 
Developer:~/environment/MainApp (linking-event-person) $ rails db:migrate
== 20210522105100 AddPersonReferenceToEvents: migrating =======================
-- add_reference(:events, :person, {:foreign_key=>true})
   -> 0.0269s
== 20210522105100 AddPersonReferenceToEvents: migrated (0.0271s) ==============






