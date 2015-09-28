print "Введите целое число и делитель"
number = gets.to_i
div = gets.to_i
range = (1..number)

sum = 0.0
div_count = 0

range.each do |i|
	next if i%div != 0
	sum += i
	div_count +=1
end

puts "Сумма введенных чисел с делением без остатка 
на #{div} = #{sum} 
Среднее арифметическое данных чисел #{sum/div_count}" 