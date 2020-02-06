require 'faker'

#reinit à chaque lancement de db:seed
Dogsitter.destroy_all
City.destroy_all
Dog.destroy_all
Strall.destroy_all

#array pour chaque class
city_ar = []
doggy_ar = []
dogsitter_ar = []

#crée les villes
10.times do
  c=City.create!(name: Faker::Address.city)
  city_ar << c
  puts "City fait"
end

#crée les chiens et les promeneurs
50.times do
  dog=Dog.create!(name: Faker::Name.first_name, city: city_ar.sample)
  doggy_ar << dog
  puts "Dog fait"

  dogsitter=Dogsitter.create!(name: Faker::Name.first_name, city: city_ar.sample)
  dogsitter_ar << dogsitter
  puts "Dogsitter fait"
end

#fait le lien entre chaque class pour les balades
20.times do
  strall=Strall.create!(date: Faker::Date.between(from: 1.year.ago, to: 1.month.from_now), city: city_ar.sample, dog: doggy_ar.sample, dogsitter: dogsitter_ar.sample)
  puts "strall fait"
end


