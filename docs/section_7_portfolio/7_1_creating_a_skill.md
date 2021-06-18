git checkout -b portfolio
M       docs/section_1_get_started/1_0_get_started_toc.md
M       docs/section_1_get_started/1_1_set_up_development_environment.md
M       docs/section_2_static_pages/2_1_created_static_pages.md
M       docs/section_3_event_tracker_person/3_1_creating_a_person.md
Switched to a new branch 'portfolio'

Developer:~/environment/MainApp (portfolio) $ rails g model Skill title:string percent_utilized:integer 
Running via Spring preloader in process 3087
      invoke  active_record
      create    db/migrate/20210617113415_create_skills.rb
      create    app/models/skill.rb
      invoke    rspec
      create      spec/models/skill_spec.rb
      
rails db:migrate
== 20210617113415 CreateSkills: migrating =====================================
-- create_table(:skills)
   -> 0.0422s
== 20210617113415 CreateSkills: migrated (0.0423s) ============================

the concole is a direct connection to the database
! = bang throws an error right away instead of failing silently


git commit -m "Portfolio - Added skill model"
rails g resource Portfolio title:string subtitle:string body:text main_image:text thumb_image:text


resource generator is a skinny scaffold
most common generator


rails db:migrate
== 20210618075410 CreatePortfolios: migrating =================================
-- create_table(:portfolios)
   -> 0.0356s
== 20210618075410 CreatePortfolios: migrated (0.0357s) ========================




