puts "Привет! Этa программа вычисляет корни квадратного уравнения вида ax^2 + bx + c = 0"
print "Введите коэффициент при х^2:"
a = gets.to_f
print "Введите коэффициент при х:"
b = gets.to_f
print "Введите значение свободного члена c:"
c = gets.to_f

dis = b**2 - 4*a*c

if dis < 0
  puts "Дискриминант равен #{dis} Уравнение имеет мнимые корни. Пардон, вычисление мнимых корней в этой версии не поддерживается"

elsif dis == 0
  result_1= -b/(2*a)
  puts "Дискриминант равен #{dis} Уравнение имеет один корень #{result_1}"	

elsif dis > 0
  result_1=(-b + dis**0.5)/(2*a)
  result_2=(-b - dis**0.5)/(2*a)
  puts "Дискриминант равен #{dis} Уравнение имеет два корня x1= #{result_1}; x2= #{result_2}"
else
  puts "Неверные данные"
end

