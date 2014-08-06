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
  doctor_to_remove = select_doctor
  Doctor.remove(doctor_to_remove.id)
  puts "Dr. #{doctor_to_remove.name.capitalize} has gone to a big farm in the sky with lots of room to run."
end

def edit_doctor
end

def add_doctor
  puts "Enter name of new doctor:"
  name = gets.chomp.upcase
  puts "Enter specialty id:"
  specialty_id = gets.chomp.to_i
  puts "Enter insurance id:"
  insurance_id = gets.chomp.to_i
  new_doctor = Doctor.new({:name => name, :specialty_id => specialty_id, :insurance_id => insurance_id})
  new_doctor.save
  puts "Dr. #{name.capitalize} - I've brought you into this world, and I can take you out of it.  ψ(｀∇´)ψ "
end

def list_doctor
  puts "Here are the doctors currently still among the living: "
  Doctor.all.each do |doctor|
    puts "#{doctor.id}) Dr. #{doctor.name.capitalize}"
    puts "  Specialty - #{doctor.specialty_id}" #Change to actual specialty
    puts "  Insurance accepted - #{doctor.insurance_id}"
    puts "  Patient count - #{doctor.count}"
  end
end

def search_doctor
  puts "Enter 's' to search doctors by specialty"
  puts "Enter 'i' to search doctors by accepted insurance"
  user_choice = gets.chomp.downcase
  case(user_choice)
  when 's'
    search_specialty
  when 'i'
    search_insurance
  else
    puts "DOES NOT COMPUTE!"
    search_doctor
  end

end

def search_specialty
  puts "Enter specialty id:"
  Doctor.specialty_search(gets.chomp.to_i).each do |doctor|
    puts "Dr. #{doctor.name.capitalize}"
    puts "  Specialty - #{doctor.specialty_id}" #Change to actual specialty
    puts "  Insurance accepted - #{doctor.insurance_id}"
    puts "  Patient count - #{doctor.count}"
  end
end

def search_insurance
  puts "Enter insurance id:"
  Doctor.insurance_search(gets.chomp.to_i).each do |doctor|
    puts "Dr. #{doctor.name.capitalize}"
    puts "  Specialty - #{doctor.specialty_id}" #Change to actual specialty
    puts "  Insurance accepted - #{doctor.insurance_id}"
    puts "  Patient count - #{doctor.count}"
  end
end

def select_doctor
  puts "Enter the doctor's name you are looking for: "
  Doctor.find_doctor(gets.chomp.upcase)[0]
end
