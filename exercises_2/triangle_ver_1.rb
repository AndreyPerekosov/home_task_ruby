puts "Привет! Это программа определит какого вида треугольник!"
puts "Введите сторону a"
a = gets.to_f
puts "Введите сторону b"
b = gets.to_f
puts "Введите сторону с"
c = gets.to_f

if (a == b ) && (b == c)
  puts "Это равносторонний треугольник"
elsif (a == b) || (a == c) || (b == c)
  puts "Это равнобедренный треугольник"
else
  puts "Это не равнобедренный или равносторонний треугольник"
end	

