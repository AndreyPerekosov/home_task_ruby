class Route
	attr_reader :route, :name

	def initialize(name, st_first, st_last)
		@name = name
		@route = []
		object_check!(st_first, st_last)
		raise ArgumentError, "Stations are the same" if st_first.name == st_last.name
		@route << st_first << st_last
	end

	def point_in(station)
		object_check!(station)
		raise "Station already exists" if route.bsearch {|obj| obj.name == station.name}
		self.route.insert(-2, station)
	end
	
	def point_out(station)
		if station.name != route[0].name && station.name != route[route.size - 1].name
			self.route.delete(station) 
		end
	end

	private
		attr_writer :route

	def object_check!(*object)
		object.each{ |obj| raise ArgumentError, "Object isn't class of Station" if obj.class != Station}
	end

end