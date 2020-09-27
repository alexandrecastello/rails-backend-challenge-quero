# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# Seeding Universities
['UNIP', 'UNINOVE', 'UNICSUL', 'MACKENZIE', 'MAUÁ', 'FMU'].each do |university|
  University.create name: university, score: ((0..50).to_a.sample.to_f)/10, logo_url: 'https://picsum.photos/200/200'
end

# Seeding Campi
20.times do
  Campus.create name: Faker::Address.unique.street_name, city: Faker::Address.unique.city 
end

#Seeding Courses
15.times do
  new_course = Courses.new name: Faker::Educator.subject
  new_course.kind = ['Presencial', 'EaD'].sample
  new_course.level = ['Bacharelado', 'Tecnólogo', 'Mestrado', 'Doutorado'].sample
  new_course.shift = new_course.kind == 'EaD' ? 'Virtual' : ['Diurno', 'Vespertino', 'Noturno'].sample
  new_course.university = University.all.sample
  new_course.campus = Campus.all.sample
  new_course.save
end

# Seeding offers
new_offer = Offer.

Faker::UniqueGenerator.clear # Clears used values for all generators