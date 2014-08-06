def patient_menu
  puts "Enter 'd' to delete a patient permanently"
  puts "Enter 'e' to edit a patient's info"
  puts "Enter 'a' to add a patient"
  puts "Enter 't' to turn out a list of patients"
  puts "Enter 'h' to head on outta here"
  user_choice = gets.chomp.downcase
  case(user_choice)
    when 'd'
      delete_patient
    when 'e'
      edit_patient
    when 'a'
      add_patient
    when 't'
      list_patient
    when 'h'
      main_menu
    else
      puts "You dishonor your family and your ancestors. Choose wisely next time. ( ꒪Д꒪)ノ"
  end
end

def delete_patient
  puts "Enter patient's name to exterminate: "
  dead_patient = search_patient
  Patient.delete_patient(dead_patient.id)
  puts "#{dead_patient.name} be pushin' up daisies, yo. 〜(￣△￣〜)"
end

def add_patient
  puts "Enter name of new patient"
  name = gets.chomp.upcase
  puts "Enter patient's doctor's id:"
  doctor_id = gets.chomp.to_i
  puts "Enter insurance id:"
  insurance_id = gets.chomp.to_i
  puts "Enter birthday (YYYY-MM-DD):"
  birthday = gets.chomp
  new_victim = Patient.new({:name => name, :doctor_id => doctor_id, :insurance_id => insurance_id, :birthday => birthday})
  new_victim.save
  puts "#{name.capitalize} has volunteered as tribute.  (｡･｀ω´･｡) "
end

def edit_patient
  puts "Enter 'd' to edit the patient's doctor"
  puts "Enter 'i' to edit the patient's insurance"
  puts "Enter 'e' to return to the patient_menu"
  user_choice = gets.chomp.downcase

  case user_choice
    when 'd'
      edit_doctor_id
    when 'i'
      patient_insurance_id
    when 'e'
      patient_menu
    else
      puts "Silence!  I kill you!  Make a correct choice!  ┻━┻ ︵ヽ(`Д´)ﾉ︵﻿ ┻━┻"
  end
end

def search_patient
  puts "Enter patient's name you are looking for:"
  Patient.find_patient(gets.chomp.upcase)[0]
end
