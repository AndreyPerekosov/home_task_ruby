class Railcar
	attr_accessor :number
	attr_reader :capacity, :capacity_load
	
	def initialize(capacity)
		@capacity = capacity
		@capacity_load = 0
		@number = 0		
	end
		
	def free_capacity
		capacity - capacity_load
	end
	
	protected

	attr_writer :capacity, :capacity_load
	
	def load!(cargo)
		self.capacity_load += cargo
		self.capacity_load = capacity if cargo_sm_wrong? 
	end

	def unload!(cargo)
		self.capacity_load -= cargo
		self.capacity_load = 0 if cargo_sm_wrong?
	end

	def cargo_sm_wrong?
		(capacity <= capacity_load) || (capacity < 0)
	end
	
end