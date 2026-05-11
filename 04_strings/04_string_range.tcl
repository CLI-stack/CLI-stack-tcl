set s "Hello, World!"

puts [string range $s 0 4]          ;# Hello
puts [string range $s 7 11]         ;# World
puts [string range $s 7 end]        ;# World!
puts [string range $s end-5 end]    ;# orld!

# Extract value between delimiters
set line "name=Alice;age=30"
set eq   [string first "=" $line]
set semi [string first ";" $line]
set name [string range $line [expr {$eq+1}] [expr {$semi-1}]]
puts "Name: $name"
