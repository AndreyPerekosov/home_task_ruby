module Validation
  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end

  module ClassMethods
    
    attr_accessor :methods  
    
    def validate (var,validation_type, *params) #сохраняет параметры валидации на уровне класса
      method_name = "#{var}_#{validation_type}".to_sym
      self.methods ||= {}
      self.methods[method_name] = params
      define_method (method_name) do
        case validation_type
          when :precence
            #puts "Yes" if instance_variable_get ("@#{var}".to_sym)
            #puts "Error!" unless instance_variable_get ("@#{var}".to_sym)
            raise ArgumentError, "Not the Nil!" unless instance_variable_get ("@#{var}".to_sym)
          when :format
            value = instance_variable_get ("@#{var}".to_sym)
            raise ArgumentError, "Wrong format!" unless value == params[0]
          when :type
            value = instance_variable_get ("@#{var}".to_sym)
            raise ArgumentError, "Wrong class!" unless value.class == params[0]
        end 
      end
    end
  end
  
  module InstanceMethods
    def validate!
      @errors = []
      methods = self.class.methods
      methods.each do |method, params|
        begin
          send method
          rescue ArgumentError 
          #puts "Catch the Error" 
          @errors << method
        end
      end
      puts "There are some errors: #{@errors}" unless @errors.empty?
    end

    def valid?
      if @errors.empty?
        true
      else
        false
      end
    end
  end    
end

  class A
    include Validation
    attr_accessor :a, :b, :c

    def initialize 
      @a = nil
      @b = "sdfsf"
      @c = 6
    end

    validate :a, :precence
    validate :b, :format, "sdfsf"
    validate :c, :type, String
  end





