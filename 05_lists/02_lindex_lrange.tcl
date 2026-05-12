# ============================================================
# 02_lindex_lrange.tcl — Accessing list elements and sublists
# ============================================================

set lst {10 20 30 40 50 60 70 80 90 100}

# "lindex lst i" returns the element at index i (0-based)
puts "index 0:      [lindex $lst 0]"       ;# 10  — first element
puts "index 4:      [lindex $lst 4]"       ;# 50
puts "index end:    [lindex $lst end]"     ;# 100 — last element
puts "index end-1:  [lindex $lst end-1]"   ;# 90  — second to last

# "lrange lst first last" returns a sublist from index first to last (inclusive)
puts "range 0 2:    [lrange $lst 0 2]"      ;# 10 20 30
puts "range 3 5:    [lrange $lst 3 5]"      ;# 40 50 60
puts "range 7 end:  [lrange $lst 7 end]"    ;# 80 90 100
puts "last 3:       [lrange $lst end-2 end]" ;# 80 90 100

# Nested list: lindex can take multiple indices to drill down
set matrix {{1 2 3} {4 5 6} {7 8 9}}
puts "Row 1:        [lindex $matrix 1]"      ;# {4 5 6}
puts "Row1,Col2:    [lindex $matrix 1 2]"    ;# 6 — row 1, column 2
