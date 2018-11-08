# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
2.times do |i|
Test.create([{title: "#{i}", level: "#{i}"},
               {title: "#{i}", level: "#{i}"}])

User.create([{email: "blob#{i}@blob.com", username: "Blob#{i}"},
             {email: "adminBob#{i}@blob.com", username: "Bob#{i}"}])

end
