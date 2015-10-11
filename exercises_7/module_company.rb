module Company
	attr_reader :company
	
	def set_company(name)
		self.company = name
	end

	protected 
	attr_writer :company

end