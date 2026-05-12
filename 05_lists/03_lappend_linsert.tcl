# ============================================================
# 03_lappend_linsert.tcl — Adding elements to lists
# ============================================================

# "lappend var elem..." appends one or more elements to the END of a list
# It modifies the variable in place — no need to reassign
set lst {1 2 3}
lappend lst 4 5 6          ;# add three elements at once
puts "After lappend: $lst"

# lappend on a non-existent variable creates a new list
lappend newlist a b c
puts "New list: $newlist"

# "linsert lst index elem..." inserts elements BEFORE the given index
# linsert does NOT modify the original — it returns a NEW list
set lst {a b c d}
puts [linsert $lst 0   X]       ;# insert before index 0 (at beginning)
puts [linsert $lst 2   X]       ;# insert before index 2
puts [linsert $lst end X]       ;# insert before last element
puts [linsert $lst end+1 X]     ;# append after last element

puts "Original unchanged: $lst" ;# linsert is non-destructive

# To update the variable you must assign the result back
set lst [linsert $lst 1 Z]
puts "After assign: $lst"
