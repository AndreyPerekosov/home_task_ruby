class CargoTrain < Train 
	attr_reader :type
	
	def initialize
		super
		@type = "cargo"
	end

	def railcar_hook(railcar)
		railcar_hook! if railcar.type == type 
	end	
end