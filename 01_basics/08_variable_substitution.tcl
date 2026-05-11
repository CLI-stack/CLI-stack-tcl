set city "Kuala Lumpur"
puts "City: $city"

# Array-style
set arr(key1) "value1"
set arr(key2) "value2"
puts "arr(key1) = $arr(key1)"
puts "All keys: [array names arr]"

# Dynamic variable name
set varname "dynamic"
set $varname "I am dynamic"
puts [set $varname]

# Environment variable
puts "HOME: $env(HOME)"
puts "PATH length: [string length $env(PATH)]"
