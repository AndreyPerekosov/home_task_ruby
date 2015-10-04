require_relative 'railcar', 'psngr_railcar',  'cargo_railcar', 'train', 'cargo_train', 'psngr_train', 'route', 'station'


stations = {}, routes = [], trains = []
stations_count, routes_count, trains_count = 1, 0, 0
puts "Для выхода из программы введите exit"
until select == 'exit'
	puts "Это конструктор объектов. Я крайне не совершенен, но попробую помочь в создании жд инфраструктуры  
	Для создания станции введите - s, маршрута - r, грузовой поезда - сt, 
	пассажирский поезд - pt,  прицепить вагоны - hc, отцепить вагоны - uc, добавить поезда на станцию - adtr, 
	загрузить вагон -  lc, разгрузить вагон - uc, показать станции - swst, показать поезда на станции - swtr"
	
	select = gets.comp

	case select
		when 's'
			print "Имя станции:"
			name = gets.chomp
			stations[stations_count] = Station.new(name)
			stations_count += 1 
		when 'r'
			print "Имя маршрута:"
			name = gets.chomp
			puts "Номер начальной стации"
			number_1 = gets.to_i
			puts "Номер конечной станции"
			number_2 = gets.to_i

			routes[routes_count] << Route.new(name, stations[number_1], stations[number_2]) 
			puts "Какие станции включить в маршрут? Для выхода введите 0"
					until number == 0
						number = gets.to_i
							routes[routes_count].point_in(stations[number]) 
					end
					routes_count += 1
		
		when 'ct'
			puts "Номер грузового поезда:"
			number = gets.to_i
			trains[trains_count] << CargoTrain.new(number)
			trains_count += 1 
		end

		when 'pt'
			print "Номер пассажирского поезда:"
			number = gets.to_i
			trains[trains_count] << PsngrTrain.new(number)
			trains_count += 1 
		
		when 'hc'
			print "Введите номер поезда для прицепки вагонов:"
			number = gets.to_i
			puts "Количество вагонов"
			count = gets.to_i
				trains.each do |train|
					if train.number == number
							count.times do 
								if train.type == "cargo"
									train.railcar_hook(CargoRailcar.new)
								else
									train.railcar_hook(PsngrRailcar.new)
   							end
							end
					end
				end

		when 'uc'
			print "Введите номер поезда для отцепки вагонов:"
			number = gets.to_i
			puts "Количество вагонов"
			count = gets.to_i
				trains.each do |train|
					if train.number == number
							count.times do
									train.railcar_unhook(train.railcars[train.railcars.size - 1])
							end
					end
				end	

			when 'lc'
				print "Введите номер поезда для загрузки вагона:"
				number = gets.to_i
				puts "Номер вагона"
				count = gets.to_i
				trains.each do |train|
					if train.number == number
							train.each do |railcar|
									if car.number == count
										if car.type == "cargo"	
											puts "Количество груза для загрузки"
											load = gets.to_f
											railcar.load(cargo)
										else
											puts "Количество человек для посадки"
											load = gets.to_i
											load.times{railcar.load}	
										end											
					 				end				    
							end
					end
				end	
				
				when 'uc'
					print "Введите номер поезда для разгрузки вагона:"
					number = gets.to_i
					puts "Номер вагона"
					count = gets.to_i
					trains.each do |train|
						if train.number == number
							train.each do |railcar|
									if car.number == count
										if car.type == "cargo"	
											puts "Количество груза для рагрузки"
											load = gets.to_f
											railcar.unload(cargo)
										else
											puts "Количество человек"
											load = gets.to_i
											load.times{railcar.unload}	
										end											
					 				end				    
							end
						end
					end

				when 'adtr'
					puts "Выбирете станцию"
					number = gets.to_i	
					puts "Номер поезда"
					number_train = gets.to_i
						train.each do |train|
					     if train.number == number_train 
					     	stations[number].train_in(train)
					     end
						end

				when 'swst'
					puts "Будет показан список всех доступных станций"
					stations.each_value {|name| puts "#{name}"}
				
				when 'swtr'
					puts	"Будет показаны поезда на выбранной станции"					
					puts "Введите номер станции"
					number = gets.to_i
					stations[number].show_train_tables		
		else 
		puts "Неверная операция"
	end	
end
 