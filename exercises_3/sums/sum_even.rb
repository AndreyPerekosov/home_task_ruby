print "Введите число"
number = gets.to_f
range = (1..number)
sum = 0
even_count = 0
range.each do |i|
	next if i%2 != 0
	sum += i
	even_count +=1
end

puts "Сумма четных введенных чисел = #{sum} 
Среднее арифметическое четных чисел #{sum/even_count}" 