# ============================================================
# 01_list_create.tcl — Creating lists in different ways
# ============================================================

# Method 1: curly brace literal — space-separated items
set l1 {a b c d e}

# Method 2: "list" command — safely handles items with spaces
set l2 [list 1 2 3 4 5]

# Method 3: "split" converts a delimited string into a list
set l3 [split "x,y,z" ","]

puts "l1: $l1"
puts "l2: $l2"
puts "l3: $l3"

# Use "list" (not braces) when elements contain spaces
# Braces would create one big element instead of three
set l4 [list "hello world" "foo bar" "tcl script"]
puts "l4: $l4"
puts "First element: [lindex $l4 0]"   ;# correctly returns "hello world"

# Build a list incrementally using lappend
set nums {}
for {set i 1} {$i <= 5} {incr i} { lappend nums $i }
puts "Built: $nums"
