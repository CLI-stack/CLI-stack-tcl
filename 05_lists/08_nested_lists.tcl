# ============================================================
# 08_nested_lists.tcl — Lists of lists (matrices and tables)
# ============================================================

# Build a 3×3 matrix as a list of lists
set matrix {}
for {set i 0} {$i < 3} {incr i} {
    set row {}
    for {set j 0} {$j < 3} {incr j} {
        lappend row [expr {$i*3 + $j + 1}]   ;# values 1-9
    }
    lappend matrix $row   ;# add completed row to the matrix
}

puts "Matrix:"
foreach row $matrix { puts "  $row" }

# Access a specific element: lindex with multiple indices drills down
puts "Element \[1\]\[2\]: [lindex $matrix 1 2]"   ;# row 1, col 2 = 6

# Transpose: swap rows and columns
proc transpose {m} {
    set rows [llength $m]
    set cols [llength [lindex $m 0]]   ;# column count = length of first row
    set t {}
    for {set j 0} {$j < $cols} {incr j} {
        set col {}
        for {set i 0} {$i < $rows} {incr i} {
            lappend col [lindex $m $i $j]   ;# collect column j from each row
        }
        lappend t $col
    }
    return $t
}

puts "\nTransposed:"
foreach row [transpose $matrix] { puts "  $row" }
