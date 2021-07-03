# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Event.delete_all
Person.delete_all

15.times do |person|
    Person.create!(
        first_name: "First Name #{person+1}",
        last_name: "Last Name #{person+1}",
        main_image: "http://placeimg.com/600/400/people",
        thumb_image: "http://placeimg.com/350/200/people"
        )
end
puts "15 new persons created"

last_person_id = Person.last.id
12.times do |event|
    Event.create!(
        title: "Birthday",
        details: "The person was born",
        main_image: "http://placeimg.com/600/400/nature",
        thumb_image: "http://placeimg.com/350/200/nature",
        day: "#{2*event+1}",
        month: "#{event+1}",
        year: "#{1950+5*event}",
        person_id: "#{last_person_id-1-event}"
        )
end
puts "12 new birthday events created"


6.times do |event|
    Event.create!(
        title: "Graduation",
        details: "Name #{event+1} graduated on #{event+1}-#{event+1}-#{event+2001}",
        main_image: "http://placeimg.com/600/400/nature",
        thumb_image: "http://placeimg.com/350/200/nature",
        day: "#{2*event+1}",
        month: "#{event+1}",
        year: "#{2000+2*event}",
        person_id: "#{last_person_id-1}"
        )
end
puts "6 new graduation events created"


10.times do |blog|
  Blog.create!(
    title: "My Blog Post #{blog}",
    body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
  )
end
puts "10 blog posts created"

5.times do |skill|
  Skill.create!(
    title: "Rails #{skill}",
    percent_utilized: 15
  )
end
puts "5 skills created"

9.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio title: #{portfolio_item}",
    subtitle: "Ruby on Rails",
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    main_image: "http://placeimg.com/600/400/nature",
    thumb_image: "http://placeimg.com/350/200/nature",
  )
end
puts "9 portfolio items created"