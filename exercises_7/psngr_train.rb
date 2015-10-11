class PsngrTrain < Train 
	attr_reader :type
	
	def initialize
		super
		@type = "passenger"
	end

	def railcar_hook(railcar)
		if railcar.type == type 
			railcar_hook! 
		else
			raise "Railcar isn't #{@type}"  
		end
	end
end