# ============================================================
# 08_variable_substitution.tcl — Variables, arrays, and env
# ============================================================

set city "Kuala Lumpur"
puts "City: $city"   ;# $var substitutes the variable value

# TCL arrays use parentheses for element access — they are associative (like dicts)
set arr(key1) "value1"
set arr(key2) "value2"
puts "arr(key1) = $arr(key1)"

# [array names] returns a list of all keys in an array
puts "All keys: [array names arr]"

# Dynamic variable names: store the variable name in another variable
set varname "dynamic"
set $varname "I am dynamic"   ;# creates variable named "dynamic"

# [set varname] with one arg reads the variable — used for dynamic access
puts [set $varname]

# $env is a special built-in array containing environment variables
puts "HOME: $env(HOME)"
puts "PATH length: [string length $env(PATH)]"
