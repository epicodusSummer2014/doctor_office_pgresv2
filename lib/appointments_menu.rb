def appointment_menu
  puts "Appointment Menu:"
  puts "Enter 'a' to add an appointment"
  puts "Enter 'l' to list appointments"
  puts "Enter 'm' to return to main menu"
  puts "Enter 's' to see the billed sum of a doctor"
  user_choice = gets.chomp.downcase
  case(user_choice)
    when 'a'
      add_appointment
    when 'l'
      list_appointments
    when 's'
      billed_sum
    when 'm'
      main_menu
    else
      puts "Please try again."
  end
  appointment_menu
end

def add_appointment
  puts "Enter doctor's name:"
  doctor = gets.chomp.upcase
  puts "Enter patient's name:"
  patient = gets.chomp.upcase
  puts "Enter appointment date (YYYY-MM-DD):"
  date = gets.chomp
  puts "Enter the cost of the appointment:"
  cost = gets.chomp.to_i
  new_appointment = Appointment.new({:doctor => doctor, :patient => patient, :date => date, :cost => cost})
  new_appointment.save
  puts "Appointment made!"
end


def list_appointments
  puts "Here are the upcoming appointments:"
  Appointment.all.each do |appointment|
    puts "Doctor: #{appointment.doctor} Patient: #{appointment.patient} Date: #{appointment.date} Cost: #{appointment.cost}"
  end
end

def billed_sum
  puts "Enter the doctor's name"
  doctor = gets.chomp.upcase
  puts "Enter the begin date"
  start_date = gets.chomp
  puts "Enter the end date"
  end_date = gets.chomp
  puts "Amount Billed:  " + Appointment.search_date(doctor, start_date, end_date).to_s
end
