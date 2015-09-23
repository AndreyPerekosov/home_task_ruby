puts "Привет! Это программа определит какого вида треугольник!"
puts "Введите сторону a"
a = gets.to_f
puts "Введите сторону b"
b = gets.to_f
puts "Введите сторону с"
c = gets.to_f

#Поиск наибольшего значения
if (a > b) && (a > c)
  hyp = a
  cat1 = b
  cat2 = c
elsif (b > a) && (b > c)
  hyp = b
  cat1 = a
  cat2 = c
elsif (c > a) && (c > b)
  hyp = c
  cat1 = a
  cat2 = b
end

if !hyp
  puts "Это равносторонний треугольник"
elsif (cat1 == cat2)
  puts "Это равнобедренный треугольник"
elsif hyp**2 == (cat1**2 + cat2**2)
  puts "Это прямоугольный треугольник"
else
  puts "Это не равнобедренный, равносторонний или прямоугольный треугольник"
end	

