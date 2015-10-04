class Train 
	attr_reader :number, :railcars, :speed, :route

	def initialize (number, speed = 0.0)
		@number = number
		@railcars = []
		@speed = speed
		@route = []
		@waypoint = 0
	end

	def speed_up
		self.speed += 10
		if speed > 110 
			self.speed = 110.0
		end
	end

	def speed_down
		self.speed -= 10 
		if speed < 0 
			self.speed = 0
		end
	end
	
	def route(route)
		self.route = route
	end

	def move_forward
		self.waypoint += 1 if waypoint < (@route.size - 1)
	end

	def move_reverse
		self.waypoint -= 1 if waypoint > 0 
	end

	def current_station
		route[@waypoint].name
	end
	
	def previous_station
		if @waypoint > 0
		 route[@waypoint - 1].name 
		end
	end

	def next_station
		if @waypoint < (@route.size - 1)
			route[@waypoint + 1).name
		end
	end

	def railcar_unhook(railcar)
		if speed_check!
			railcars.delete(railcar)
			railcar.name = nil
		end
	end


protected

attr_writer :railcars, :speed, :route, :waypoint

	def speed_check!
		check = (speed == 0)
	end


	def railcar_hook!(railcar)
		if speed_check!
			railcars << railcar
			railcar.number = railcars.size
		end
	end

end