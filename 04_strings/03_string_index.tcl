set s "Hello, World!"

puts "index 0:     [string index $s 0]"
puts "index 7:     [string index $s 7]"
puts "index end:   [string index $s end]"
puts "index end-1: [string index $s end-1]"

puts "first 'l': [string first l $s]"
puts "first 'o': [string first o $s]"
puts "last  'l': [string last  l $s]"
puts "find 'l' after 4: [string first l $s 4]"
