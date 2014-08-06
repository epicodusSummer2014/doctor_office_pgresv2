def insurance_menu
  puts "Enter 's' to add a specialty"
  puts "Enter 'h' to hightail it back to the main menu"
  puts "Enter 'h' to...well it's just for dramatic effect"
  user_choice = gets.chomp.downcase
  case(user_choice)
    when 'a'
      add_specialty
    when 'h'
      main_menu
    else
      puts "I'm sorry sir/madame, but I cannot comply with your ludicrous request. Perhaps another time. ｡◕‿◕｡"
    end
end

def add_specialty
  puts "Enter specialty:"
  new_specialty = Specialty.new({:name => gets.chomp.upcase})
  new_specialty.save
  puts "Really? #{new_specialty.name.capitalize} is an actual respectable field?「(°ヘ°) "
end


