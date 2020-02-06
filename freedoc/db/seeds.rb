require 'faker'

#les 6 lignes suivantes servent à repartir à zéro à chaque lancement de db:seed
Doctor.destroy_all
Appointment.destroy_all
Patient.destroy_all
City.destroy_all
Specialty.destroy_all
DocSpe.destroy_all

#arrays pour chaque classe
c_ar = []
d_ar = []
p_ar = []
s_ar = [] 

#génération des villes
5.times do
  c=City.create!(name: Faker::Address.city)
  c_ar << c
  puts "City fait"
end

#génération des docteurs et patients
50.times do
  d=Doctor.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, zip_code: Faker::Address.zip_code, city:c_ar.sample) #vient chercher dans les arrays correspondants
  d_ar << d
  puts "Doctor fait"    
  
  p=Patient.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city:c_ar.sample)
  p_ar << p
  puts "Patient fait"
end

#génération des spécialités
5.times do
  s=Specialty.create!(name: Faker::Job.title)
  s_ar << s
  puts "Specialty fait"
end

#génération des rdv
50.times do
  rdv=Appointment.create!(date: Faker::Date.between(from: 2.years.ago, to: 1.year.from_now), city: c_ar.sample, doctor:d_ar.sample, patient:p_ar.sample)
  puts "RDV fait"
end

#génération de la table de jonction des docs avec les spés
50.times do 
  spe=DocSpe.create!(doctor: d_ar.sample, specialty: s_ar.sample)
  puts "jonction ok"
end
