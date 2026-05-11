set integer 42
set float   3.14
set string  "Hello"
set boolean 1

puts "Integer: $integer  is_int=[string is integer $integer]"
puts "Float:   $float    is_dbl=[string is double  $float]"
puts "String:  $string   is_alp=[string is alpha   $string]"
puts "Boolean: $boolean  is_boo=[string is boolean $boolean]"

# Everything is a string internally
puts "Type of 42: [string is integer 42]"
puts "Type of 42: [string is double  42]"
