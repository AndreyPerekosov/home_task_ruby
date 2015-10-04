class PsngrRailcar < Railcar
	attr_reader :type
	PSNGR_CAP = 100
	def initialize(PSNGR_CAP)
		super
		@type = "passenger"	
	end	
	
	def load
		load!(1)
	end
	
	def unload
		unload!(1)
	end
end