set l1 {a b c d e}
set l2 [list 1 2 3 4 5]
set l3 [split "x,y,z" ","]

puts "l1: $l1"
puts "l2: $l2"
puts "l3: $l3"

# Elements with spaces require list
set l4 [list "hello world" "foo bar" "tcl script"]
puts "l4: $l4"
puts "First: [lindex $l4 0]"

set nums {}
for {set i 1} {$i <= 5} {incr i} { lappend nums $i }
puts "Built: $nums"
