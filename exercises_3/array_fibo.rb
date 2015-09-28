a = [0, 1]
init = init_2 = 0
init_1 = 1

loop do init > 100
	init = init_1 + init_2
	break if init > 100
	a << init 
	init_2 = init_1
	init_1 = init
end
puts a
