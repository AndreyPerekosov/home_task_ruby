class Route
	attr_reader :route, :name

	def initialize(name, st_first, st_last)
		@name = name
		@route = []
		@route << st_first << st_last
	end

private
attr_writer :route

	def point_in(station)
		self.route.insert(-2, station)
	end
	
	def point_out(station)
		if station.name != route[0].name && station.name != route[route.size - 1].name
			self.route.delete(station) 
		end
	end

end