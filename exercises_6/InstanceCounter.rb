module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end


  module ClassMethods
		
		
		def instances(var) 
       var.size
    end
  end
	
	module InstanceMethods	
	protected
		def register_instance(var)
      var << self
		end
	end
end

class A
  @@count = []

  include InstanceCounter
  
  def self.count
  puts instances(@@count)
  end

	def initialize
		register_instance(@@count)
	end
end

class B
	@@count = []

  include InstanceCounter
	
  def self.count
  puts instances(@@count)
  end

  def initialize
		register_instance(@@count)
	end
end