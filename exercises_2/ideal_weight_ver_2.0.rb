puts "Привет! Это программа определит Ваш оптимальный вес!"
puts "Введите свое имя"
name = gets.chomp
puts "Введите свой рост"
height = gets.to_i
if (height - 110) <=0
puts "#{name}!Сначала подрасти! Удачного дня!"
else  
puts "#{name}!Ваш оптимальный вес #{height - 110}кг! Удачного дня!"
end