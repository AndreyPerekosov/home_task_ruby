class Station
	
	attr_reader :name, :table

	def initialize(name)
			@name = name
			@table = []	
	end
		
	def train_in (train)
			table << train
	end

	def train_out (train)
			table.delete[train]
	end

	def show_train_tables
		puts " Cargo train: #{table_sort!("cargo")} Sum: #{table_sort!(cargo).lenght}"
		puts " Passenger train: #{table_sort!("passenger")} Sum: #{table_sort!(passenger).lenght}"
	end


	private
	
	attr_reader :table
	
	def table_sort!(type)
		hashe = {}
		table.each do |train|
			hashe[train.number] = type if train.type == type
		end 
		hashe	
	end

end