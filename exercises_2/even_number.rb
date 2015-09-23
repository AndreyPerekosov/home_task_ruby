puts "Привет! Это программа проверяет четно ли целое число!"
print "Введите целое число a:"
number = gets.to_i
number %= 2
if number == 0 
  puts "Число четное"
else
  puts "Число нечетное"
end  