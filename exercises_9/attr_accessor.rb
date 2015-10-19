module AttrAccessor

  def attr_accessor_with_history(*names)
    names.each do |name|
      var_name = "@#{name}".to_sym
      
      define_method(name){ instance_variable_get(var_name) }
      define_method("#{name}_history"){ @var_values[var_name] }                          
      
      define_method("#{name}=") do |value|
        instance_variable_set(var_name, value)
        @var_values ||= {}
        @var_values[var_name] ||= []
        @var_values[var_name] << value
      end
    end
  end

  def strong_attr_accessor(name, type)
    var_name = "@#{name}".to_sym
    define_method(name){ instance_variable_get(var_name) }
    define_method("#{name}=") do |value|
      if type == value.class
        instance_variable_set(var_name, value)
      else 
        raise ArgumentError, "Invalid argument"
      end
    end
  end




end

class A
  extend AttrAccessor
  
  attr_accessor_with_history :a, :b

  strong_attr_accessor :d, String
  

end    

a = A.new
a.a=5
a.a=6
a.a=7
a.b=4
a.b=5
puts "#{a.a_history}"
puts "#{a.b_history}"

a.d = "asdf"
puts a.d
a.d = 324
puts a.d



