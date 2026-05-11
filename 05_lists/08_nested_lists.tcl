set matrix {}
for {set i 0} {$i < 3} {incr i} {
    set row {}
    for {set j 0} {$j < 3} {incr j} {
        lappend row [expr {$i*3 + $j + 1}]
    }
    lappend matrix $row
}

puts "Matrix:"
foreach row $matrix { puts "  $row" }
puts "Element \[1\]\[2\]: [lindex $matrix 1 2]"

proc transpose {m} {
    set rows [llength $m]
    set cols [llength [lindex $m 0]]
    set t {}
    for {set j 0} {$j < $cols} {incr j} {
        set col {}
        for {set i 0} {$i < $rows} {incr i} {
            lappend col [lindex $m $i $j]
        }
        lappend t $col
    }
    return $t
}

puts "\nTransposed:"
foreach row [transpose $matrix] { puts "  $row" }
