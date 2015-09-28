print "Введите число"
day = gets.to_i
print "Введите месяц"
month = gets.to_i
print "Введите год"
year = gets.to_i
arr = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
month -= 1

for index in arr
 	break if month == 0
 	day += index 
 	month -= 1
end

message = (((year%4 == 0) && (year%100 != 0))  || (year%400 == 0)) && (day > 60) ? "Это #{day + 1} день в году" : "Это #{day} день в году"

puts message