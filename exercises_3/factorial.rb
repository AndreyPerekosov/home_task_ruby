print "Введите чило"
number = gets.to_i
range = (1..number)

fact = 1

range.each do |i|
	fact *= i
end

puts "Факториал числа #{number} = #{fact}" 