# ============================================================
# 09_ternary_style.tcl — Conditional expressions and patterns
# ============================================================

set x 10

# expr supports the C-style ternary operator: cond ? a : b
# Returns a if cond is true, b if false
set label [expr {$x > 5 ? "big" : "small"}]
puts "Label: $label"

# Procs using ternary for clean one-liner logic
proc max {a b} { return [expr {$a > $b ? $a : $b}] }
proc min {a b} { return [expr {$a < $b ? $a : $b}] }
puts "max(7,3)=[max 7 3]  min(7,3)=[min 7 3]"

# Chained ternary for multiple conditions (like else-if chain)
# Read right-to-left: if x<0 → negative; elif x==0 → zero; else → positive
set cat [expr {$x < 0 ? "negative" : $x == 0 ? "zero" : "positive"}]
puts "Category: $cat"

# Boolean-index trick: use a 0/1 value to index into a two-element list
# lindex picks element 0 (false) or element 1 (true)
set opts {"no" "yes"}
set flag 1
puts "Flag means: [lindex $opts $flag]"    ;# prints "yes"
