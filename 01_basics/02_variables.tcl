set name "TCL"
set version 8.6
set pi 3.14159

puts "Language: $name"
puts "Version:  $version"
puts "Pi:       $pi"

unset pi
puts "After unset, vars defined: [info vars]"
