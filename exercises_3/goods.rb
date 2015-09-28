=begin a = {a: {3 => 4}, b: {5 => 6}}
a.each_value do |sub_a|
	sub_a.each do |v, k|
		puts "#{v}: #{k}"
	end
=end
goods={}

puts "Введите желаемый товар, цену и количество. Для остановки введите 'стоп'"  

loop do 
	goods_sub={}
	good = gets.chomp
	break if good == 'стоп'
	price = gets.to_i
	count = gets.to_f
	goods_sub [price] = count
	goods [good] = goods_sub
end

sum = 0.0

goods.each do |n, sub| 
	sub.each do |p, v|
		sum +=(p*v)
		puts "#{n} : #{p} : #{v} сумма #{p*v}"
	end
end
puts "Общая сумма #{sum}"
