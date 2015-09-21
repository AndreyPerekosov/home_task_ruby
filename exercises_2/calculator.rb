puts "Привет! Это программа-калькулятор!"
puts "Введите число a"
a = gets.to_f
puts "Введите число b"
b = gets.to_f
puts "Что хотим вычислить? Введите + - * / для выполнения желаемой операции"
choice = gets.strip
if choice == '+'
result = a + b
elsif choice == '-'
result = a - b
elsif choice == '*'
result = a * b
elsif choice == '/' && b!= 0
result = a / b
elsif choice == '/' && b == 0	
puts "Вы пытаетесь делить на ноль! Ответ - бесконечность! Удачного дня"
else
puts "Неправильный оператор"
end
puts "#{a} #{choice} #{b} = #{result} Удачного дня!" if result != nil