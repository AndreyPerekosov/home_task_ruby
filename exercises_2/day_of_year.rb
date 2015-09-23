puts "Привет! Это программа определит порядковый номер дня в году!"
puts "Введите число"
day = gets.to_i
puts "Введите номер месяца"
month = gets.to_i
puts "Введите год"
year = gets.to_i

case month
  when 1
  	result = day
  when 2
  	result = (day + 31)
  when 3
  	result = (day + 59)
  when 4
  	result = (day + 90)
  when 5
  	result = (day + 120)
  when 6
  	result = (day + 151)
  when 7
  	result = (day + 181)
  when 8
  	result = (day + 212)
  when 9
  	result = (day + 243)
  when 10
  	result = (day + 273)
  when 11
  	result = (day + 304)
  when 12
  	result = (day + 334)
  else
  puts "Неправильный месяц"
end

result += 1 if result && (year%4 == 0) && (month > 2)

puts "Порядковый номер дня равен #{result}"
