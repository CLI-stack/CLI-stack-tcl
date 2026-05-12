# ============================================================
# 05_string_basics.tcl — String creation and concatenation
# ============================================================

set first "Hello"
set last  "World"

# Variables inside double quotes are expanded (substituted)
set msg "$first, $last!"
puts $msg

# "append" modifies a variable in place by adding to its end
# More efficient than reassignment for building strings
append msg " How are you?"
puts $msg

# Double quotes: substitution happens — $x becomes its value
set x 5
puts "Value is $x"

# Curly braces { }: NO substitution — everything is treated literally
# Useful when you want to pass the raw text including $ and []
puts {Value is $x}

# "string length" counts the number of characters
puts "Length: [string length $msg]"
