# letters = ("a".."z").to_a
# #array_vow = letters.select {|l| l =~ /[euioa]/}
# hash_vow = {}

# #array_vow.each do |v|
# 	hash_vow[v.to_sym] = i
# 	i += 1 
# end
# hash_vow.each do |v, k|
# 	puts "#{v}: #{k}"
# end
letters  = ("a".."z")
array_vow = ["e", "u", "i", "o", "a"]
hash_vow = {}
i = 0

# letters.each do |letter|
#   i +=1
#   array_vow.each do |vow|
#     hash_vow[letter] = i if vow == letter
#   end
# end
#Вариант работает но можно еще с помощью метода include?

letters.each do |letter|
  i+=1
  hash_vow[letter] = i if array_vow.include?(letter)
end

hash_vow.each { |k, v| puts "#{k}: #{v}"  }