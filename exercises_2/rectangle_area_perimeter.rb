puts "Привет! Это программа определит периметр или площадь прямоугольника по двум сторонам!"
puts "Введите сторону a"
a = gets.to_f
puts "Введите сторону b"
b = gets.to_f
puts "Что хотим вычислить? Для вычисления периметра введите 1, для вычисления площади введите 2"
choice = gets.to_i
if choice == 1
puts "Периметр прямоугольника равен #{2*(a+b)}! Удачного дня!"
else
puts "Площадь прямоугольника равна #{a*b}! Удачного дня!"
end