puts "Введите количество студентов"
student = gets.to_i
a = Array.new(student)
sum = 0
i = 1
a.each do |student|
	puts "Введите оценку для #{i} студента"
	student = gets.to_i
	sum += student
	i +=1
end
puts "Средняя оценка равна #{sum/a.size}"
