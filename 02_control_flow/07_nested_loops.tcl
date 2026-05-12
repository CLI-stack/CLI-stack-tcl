# ============================================================
# 07_nested_loops.tcl — Practical nested loop patterns
# ============================================================

# Multiplication table using nested for loops
puts "Multiplication table (5x5):"
for {set i 1} {$i <= 5} {incr i} {
    for {set j 1} {$j <= 5} {incr j} {
        # format "%4d" ensures columns align by using 4-char wide fields
        puts -nonewline [format "%4d" [expr {$i * $j}]]
    }
    puts ""   ;# end of row — print newline
}

# Triangle pattern: each row prints i repetitions of "* "
puts "\nTriangle:"
for {set i 1} {$i <= 5} {incr i} {
    # "string repeat" repeats a string n times
    puts [string repeat "* " $i]
}

# Nested foreach with record-style data
# Each element of $data is a two-element sublist {name age}
puts "\nNested foreach — person records:"
set data {{Alice 25} {Bob 30} {Carol 28}}
foreach person $data {
    # lassign unpacks a list into named variables
    lassign $person name age
    puts "  $name is $age years old"
}
