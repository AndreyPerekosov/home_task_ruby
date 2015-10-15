require_relative 'module_company'

class Train 
  
  include Company

  attr_reader :number, :railcars, :speed, :route
  
  @@numbers = {}

  NUMBER_FORMAT = /\A[a-z0-9]{3}[-]{0,1}[a-z0-9]{2}\Z/i

  def self.find(number)
    @@numbers[number]
  end


  def initialize (number, speed = 0.0)
    @number = number
    @railcars = []
    @speed = speed
    @@numbers[number] = self
    validate!
    @route = []
    @waypoint = 0
  end

  def valid?
    validate!
  rescue
    false
  end

  # Метод обработки вагонов поезда принимающий блок 
  def railcars_handler(&block)
    railcars.each do |object|
      block.call(object)
    end
  end


  def speed_up
    self.speed += 10
    if speed > 110 
      self.speed = 110.0
    end
  end

  def speed_down
    self.speed -= 10 
    if speed < 0 
      self.speed = 0
    end
  end
  
  def route(route)
    self.route = route
  end

  def move_forward
    self.waypoint += 1 if waypoint < (route.size - 1)
  end

  def move_reverse
    self.waypoint -= 1 if waypoint > 0 
  end

  def current_station
    route[waypoint].name
  end
  
  def previous_station
    if waypoint > 0
     route[waypoint - 1].name 
    end
  end

  def next_station
    if @waypoint < (@route.size - 1)
      route[waypoint + 1].name
    end
  end

  def railcar_unhook
    if train_stoped?
      railcars.delete(railcars.size - 1)
    end
  end


protected

attr_writer :railcars, :speed, :route, :waypoint, :number

  def train_stoped?
    speed == 0
  end


  def railcar_hook!(railcar)
    if train_stoped?
      railcars << railcar
      railcar.number = railcars.size
    end
  end

  def validate!
    raise ArgumentError, "Speed can't be negative" if speed < 0
    raise "This train already exists" if @@numbers[number]
    raise ArgumentError, "Wrong number" if number !~ NUMBER_FORMAT 
    true
  end


end