print "Введите число"
number = gets.to_f
sum = 0.0
index = 0.0
until index >= number 
	index += 1
	sum += index
end
puts "Сумма введенных чисел = #{sum} Среднее арифметическое #{sum/number}" 