set first "Hello"
set last  "World"

# Concatenation via interpolation
set msg "$first, $last!"
puts $msg

# append command (mutates in place)
append msg " How are you?"
puts $msg

# Double-quotes interpolate; curly braces do not
set x 5
puts "Value is $x"
puts {Value is $x}

# String length
puts "Length: [string length $msg]"
