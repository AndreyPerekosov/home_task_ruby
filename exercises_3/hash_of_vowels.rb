letters = ("a".."z").to_a
array_vow = letters.select {|l| l =~ /[euioa]/}

hash_vow = {}
i = 0
array_vow.each do |v|
	hash_vow[v.to_sym] = i
	i += 1 
end
hash_vow.each do |v, k|
	puts "#{v}: #{k}"
end
