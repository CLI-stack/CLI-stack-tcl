# ============================================================
# 04_for.tcl — C-style for loop
# ============================================================

# for {init} {condition} {step} {body}
# init runs once; condition checked before each iteration; step runs after body
for {set i 0} {$i < 5} {incr i} {
    puts "i = $i"
}

# Count by 2 — "incr i 2" increments by 2 each step
puts -nonewline "Evens: "
for {set i 0} {$i <= 10} {incr i 2} {
    puts -nonewline "$i "   ;# -nonewline keeps cursor on same line
}
puts ""   ;# print final newline

# Countdown — "incr i -1" decrements by 1
puts -nonewline "Countdown: "
for {set i 5} {$i >= 0} {incr i -1} {
    puts -nonewline "$i "
}
puts ""

# Nested for — outer row, inner column (multiplication table)
for {set r 1} {$r <= 3} {incr r} {
    for {set c 1} {$c <= 3} {incr c} {
        # format "%4d" right-aligns the number in a 4-char field
        puts -nonewline [format "%4d" [expr {$r * $c}]]
    }
    puts ""   ;# newline after each row
}
