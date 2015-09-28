print "Введите число"
number = gets.to_f
range = (1..number)
sum = 0.0
range.each do |index|
	sum += index
end
puts "Сумма введенных чисел = #{sum} Среднее арифметическое #{sum/number}" 