# ============================================================
# 02_variables.tcl — Variable declaration and usage
# ============================================================

# "set" assigns a value to a variable — TCL has no type declarations
set name "TCL"       ;# string value
set version 8.6      ;# numeric value (stored as string internally)
set pi 3.14159       ;# floating point

# $variable performs variable substitution inside double-quoted strings
puts "Language: $name"
puts "Version:  $version"
puts "Pi:       $pi"

# "unset" removes a variable from the current scope
unset pi

# [info vars] returns a list of all currently defined variable names
puts "After unset, vars defined: [info vars]"
