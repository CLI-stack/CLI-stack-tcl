set lst {10 20 30 40 50 60 70 80 90 100}

puts "index 0:      [lindex $lst 0]"
puts "index 4:      [lindex $lst 4]"
puts "index end:    [lindex $lst end]"
puts "index end-1:  [lindex $lst end-1]"

puts "range 0 2:    [lrange $lst 0 2]"
puts "range 3 5:    [lrange $lst 3 5]"
puts "range 7 end:  [lrange $lst 7 end]"
puts "last 3:       [lrange $lst end-2 end]"

set matrix {{1 2 3} {4 5 6} {7 8 9}}
puts "Row 1:        [lindex $matrix 1]"
puts "Row1,Col2:    [lindex $matrix 1 2]"
