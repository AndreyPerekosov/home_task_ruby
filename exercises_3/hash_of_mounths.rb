mounths = {january: 31, february: 28, march: 31, april: 30, 
may: 31, june: 30, july: 31, august: 31, september: 30, 
october: 31, november: 30, december: 31}
#вывод с использованием if
mounths.each do |k, v| 
	puts "#{k}: #{v}" if v == 30
end
#Вывод с вызовом метода .select
#puts #{mounths.select {|k, v| v == 30} - это вариант неформатированного вывода

	
         
