class Train
	attr_accessor :speed, :railcars_count
	attr_reader :type, :number

	def initialize (number, type, railcars_count = 0, speed = 0)
		@number = number.to_i
		@type = type.chomp
		@railcars_count = railcars_count.to_i
		@speed = speed.to_f
		@route = []
		@station = 0
	end

	def speed_up
		self.speed += 10
		if speed > 110 
			self.speed = 110.0
			puts "Overspeed! Speed has been reduced to #{speed} km/h"
		end
	end

	def speed_down
		self.speed -= 10 
		if speed < 0 
			self.speed = 0
			puts "Error! Speed has been set to #{speed} km/h"
		end
	end

	def railcars_change(opr)
		if speed == 0
			case opr
			when '-'
				self.railcars_count -= 1
				self.railcars_count = 0 if railcars_count < 0 
			when '+'
				self.railcars_count += 1
			end
		else
			puts "Can't do this operation in move. Speed is #{speed} km/h"
		end
	end

	def route(route)
		@route = route.route
	end

	def move_f
		@station += 1 if @station < (@route.size - 1)
	end

	def move_r
		@station -= 1 if station > 0 
	end

	def cur_st
		puts "Current station is #{@route[@station]}"
	end
	
	def pr_st
		puts @station > 0 ? "Previous station is #{@route[@station]}" : "Current station is the first"
	end

	def next_st
		puts @station < (@route.size - 1) ? "Next station is #{@route[@station]}" : "Current station is last"
	end

end

class Station
	
	attr_reader :st_name, :st_table

	def initialize(st_name)
			@st_name = st_name
			@st_table = {}	
	end
		
	def in (train)
			@st_table[train.number] = train.type
	end

	def out (train)
			@st_table.delete(train.number)
	end

	def table
			pas_count = 0
			cargo_count = 0
			
			@st.table.each_value do |v|
				pas_count += 1 if v == 'pas'
				cargo_count += 1 if v == 'cargo'
			end				
				puts "Quantity of cargo trains: #{cargo_count}"
				puts "Quantity of passenger trains: #{pas_count}"
	end

end
 
class Route
	attr_reader :route	

	def initialize(st_first, st_last)
		@route = []
		@route << st_first.name << st_last.name
		@st_count = 0	
	end

	def point_in(name)
		@st_count +=1
		@route.insert(@st_count, name)
	end
	
	def point_out(name)
		if name == @route[0] || name == @route[@route.size - 1]
			puts "You can't remove station of departure and destination"
		else 
			@route.delete(name)
			@st_count -= 1
		end
	end

end
