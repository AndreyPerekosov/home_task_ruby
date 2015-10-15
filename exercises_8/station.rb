class Station
  
  attr_reader :name, :table
  
  @@names = []
  NAME_FORMAT = /\A[a-z]+\Z/i

  def self.all
    @@names.each {|name| puts "#{name}"}
  end


  def initialize(name)
      @name = name
      validate!
      @table = []
      @@names << name 
  end
    
  def valid?
    validate!
  rescue
    false
  end

  # Метод обработки поездов на станции принимающий блок
  def trains_handler(&block)
    table.each do |object|
      block.call(object)
    end
  end

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
  
  attr_writer :table
  
  def table_sort!(type)
    hashe = {}
    table.each do |train|
      hashe[train.number] = type if train.type == type
    end 
    hashe 
  end
    def validate!
      raise ArgumentError, "Wrong name" if name !~ NAME_FORMAT
      true
    end
end