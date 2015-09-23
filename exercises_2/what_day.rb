puts "Привет! Эта программа определяет день недели по введенному числу"
puts "Введите число от одного до семи"
day = gets.to_i

case day
  when 1
 	puts "#{day} это понедельник!" 
  when 2
 	puts "#{day} это вторник!"
  when 3
 	put4 "#{day} это среда!"	
  when 4
    puts "#{day} это четверг!"
  when 5
    puts "#{day} это пятница!"
  when 6
    puts "#{day} это суббота!"
  when 7
    puts "#{day} это воскресенье!"
  
  else
    puts "#{day} неверное число!"
  
  end	