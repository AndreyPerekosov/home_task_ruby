print "Введите чило"
number = gets.to_f
range = (1..number)

sum = 0.0

range.each do |i|
	sum += (i *= i)
end

puts "Сумма #{sum}" 