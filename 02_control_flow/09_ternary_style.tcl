set x 10

# expr ternary
set label [expr {$x > 5 ? "big" : "small"}]
puts "Label: $label"

# Proc using ternary
proc max {a b} { return [expr {$a > $b ? $a : $b}] }
proc min {a b} { return [expr {$a < $b ? $a : $b}] }
puts "max(7,3)=[max 7 3]  min(7,3)=[min 7 3]"

# Chained ternary
set cat [expr {$x < 0 ? "negative" : $x == 0 ? "zero" : "positive"}]
puts "Category: $cat"

# lindex boolean selector trick
set opts {"no" "yes"}
set flag 1
puts "Flag means: [lindex $opts $flag]"
