require_relative 'module_company'

class Railcar
	include Company

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
	
	def wrong_cargo!
		raise ArgumentError, "Cargo can't be negative"
	end

	def load!(cargo)
		wrong_cargo! if cargo < 0
		self.capacity_load += cargo
		self.capacity_load = capacity if cargo_wrong? 
	end

	def unload!(cargo)
		wrong_cargo! if cargo < 0
		self.capacity_load -= cargo
		self.capacity_load = 0 if cargo_wrong(cargo)?
	end

	def cargo_wrong?
		(capacity <= capacity_load) || (capacity < 0)
	end
	
end