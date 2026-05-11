set lst {a b c d e f}

puts [lreplace $lst 2 2 X]        ;# replace single
puts [lreplace $lst 1 3 X Y]      ;# replace range with fewer
puts [lreplace $lst 2 2]          ;# delete (replace with nothing)
puts [lreplace $lst end end Z]    ;# replace last
puts [lreplace $lst 0 0 W X Y Z]  ;# expand

puts "Original unchanged: $lst"

set lst [lreplace $lst 0 0 "NEW"]
puts "Mutated: $lst"
