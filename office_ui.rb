require 'pg'
require './lib/doctors'
require './lib/patients'
require './lib/specialties'
require './lib/insurance'
require './lib/doctor_menu'
require './lib/patient_menu'
require './lib/insurance_menu'

DB = PG.connect({:dbname => 'office_test'})

# DB.exec("DELETE FROM doctors *;")
# DB.exec("DELETE FROM patients *;")
# DB.exec("DELETE FROM specialities *;")
# DB.exec("DELETE FROM insurance *;")

def main_menu

  puts "Doctor's Office Manager"
  puts "Enter 's' to access specialities menu."
  puts "Enter 'p' to access patient menu."
  puts "Enter 'i' to access insurance menu."
  puts "Enter 'd' to access doctor menu."
  puts "Enter 'e' to exit"
  puts "Enter 'r' to access README"

  user_choice = gets.chomp.downcase

  case user_choice
    when 's'
      specialities_menu
    when 'p'
      patient_menu
    when 'i'
      insurance_menu
    when 'd'
      doctor_menu
    when 'e'
      puts "Goodbye!"
      sleep 1
      exit
    when 'r'
      display_readme
    else
      puts "Enter something proper, ya jackass"
  end

main_menu
end


main_menu

