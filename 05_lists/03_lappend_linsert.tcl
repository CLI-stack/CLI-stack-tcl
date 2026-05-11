set lst {1 2 3}
lappend lst 4 5 6
puts "After lappend: $lst"

lappend newlist a b c
puts "New list: $newlist"

set lst {a b c d}
puts [linsert $lst 0   X]      ;# beginning
puts [linsert $lst 2   X]      ;# middle
puts [linsert $lst end X]      ;# before last
puts [linsert $lst end+1 X]    ;# append

puts "Original unchanged: $lst"

set lst [linsert $lst 1 Z]
puts "After assign: $lst"
