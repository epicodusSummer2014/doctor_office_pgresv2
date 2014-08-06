def insurance_menu
  puts "Enter 'a' to add an insurance company"
  puts "Enter 'h' to hightail it back to the main menu"
  user_choice = gets.chomp.downcase
  case(user_choice)
    when 'a'
      add_insurance
    when 'h'
      main_menu
    else
      puts "I'm sorry sir/madame, but I cannot comply with your ludicrous request. Perhaps another time. ｡◕‿◕｡"
    end
end

def add_insurance
  puts "Enter name of insurance company:"
  new_insurance = Insurance.new({:name => gets.chomp.upcase})
  new_insurance.save
  puts "Muhahahahahahahaha!!! said #{new_insurance.name} mischeviously... (⊙...⊙ )"
end


