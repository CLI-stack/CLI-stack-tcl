# ============================================================
# 06_break_continue.tcl — break and continue
# ============================================================

# "break" exits the innermost enclosing loop immediately
puts -nonewline "break at 5: "
for {set i 0} {$i < 10} {incr i} {
    if {$i == 5} break       ;# stop the loop when i reaches 5
    puts -nonewline "$i "
}
puts ""

# "continue" skips the rest of the current iteration and jumps to the next
puts -nonewline "odd only: "
for {set i 0} {$i < 10} {incr i} {
    if {$i % 2 == 0} continue   ;# skip even numbers
    puts -nonewline "$i "
}
puts ""

# Important: break only exits the INNERMOST loop
# The outer loop continues normally after the inner loop breaks
puts "nested break:"
for {set i 0} {$i < 3} {incr i} {
    for {set j 0} {$j < 3} {incr j} {
        if {$j == 1} break   ;# exits inner loop only; outer keeps going
        puts "  ($i,$j)"
    }
}
