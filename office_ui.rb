require 'pg'
require './lib/doctors'
require './lib/patients'
require './lib/specialties'
require './lib/insurance'

DB = PG.connect({:dbname => 'office_test'})

DB.exec("DELETE FROM doctors *;")
DB.exec("DELETE FROM patients *;")
DB.exec("DELETE FROM specialities *;")
DB.exec("DELETE FROM insurance *;")

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

def doctor_menu
  puts "Enter 'r' to remove a doctor with extreme prejudice"
  puts "Enter 'e' to edit doctor information"
  puts "Enter 'a' to add a doctor"
  puts "Enter 'l' to list all doctors"
  puts "Enter 'm' to return to main menu"
  puts "Enter 's' to search for specific doctor information"

  user_choice = gets.chomp.downcase

  case user_choice
    when 'r'
      remove_doctor
    when 'e'
      edit_doctor
    when 'a'
      add_doctor
    when 'l'
      list_doctor
    when 'm'
      main_menu
    when 's'
      search_doctor
    else
      puts 'Do you feel lucky, punk? Try again. (╬ ಠ益ಠ)'
    end
    doctor_menu
end

def remove_doctor

end

def edit_doctor
end

def add_doctor
end

def list_doctor
end

def search_doctor
end

def select_doctor
  puts "Enter the doctor's name you are looking for"
  Doctor.find_doctor(gets.chomp.upcase)[0]
end


