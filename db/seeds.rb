# This file contains all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'faker'

# Seeding Universities
['UNIP', 'UNINOVE', 'UNICSUL', 'MACKENZIE', 'MAUÁ', 'FMU'].each do |university|
  University.create name: university, score: (0..50).to_a.sample/10.0, logo_url: 'https://picsum.photos/200/200'
end

# Seeding Campi
20.times do
  Campus.create name: Faker::Address.unique.street_name, city: Faker::Address.unique.city 
end

#Seeding Courses
15.times do
  new_course = Course.new name: Faker::Educator.subject
  new_course.kind = ['Presencial', 'EaD'].sample
  new_course.level = ['Bacharelado', 'Tecnólogo', 'Mestrado', 'Doutorado'].sample
  new_course.shift = new_course.kind == 'EaD' ? 'Virtual' : ['Diurno', 'Vespertino', 'Noturno'].sample
  new_course.university = University.all.sample
  new_course.campus = Campus.all.sample
  new_course.save
end

# Seeding Offers
30.times do
  new_offer = Offer.new
  new_offer.full_price = (400..3000).to_a.sample.to_f
  new_offer.discount_percentage = (30..70).to_a.sample.to_f
  new_offer.price_with_discount = new_offer.full_price * (1.0 - new_offer.discount_percentage / 100)
  new_offer.start_date = ['01/02/2021', '01/08/2021'].sample
  new_offer.enrollment_semester = new_offer.start_date[-4..-1] << '.' << (new_offer.start_date[4] == '8' ? '2' : '1')
  new_offer.course = Course.all.sample
  new_offer.enabled = [true, false].sample
  new_offer.save
end

# Clears used values for all generators
Faker::UniqueGenerator.clear 