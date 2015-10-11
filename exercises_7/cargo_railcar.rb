class CargoRailcar < Railcar
	attr_reader :type
	CARGO_CAP = 100.00
	def initialize(CARGO_CAP)
		super
		@type = "cargo"	
	end	
	
	def load(cargo)
		load!(cargo)
	end
	
	def unload(cargo)
		unload!(cargo)
	end
end