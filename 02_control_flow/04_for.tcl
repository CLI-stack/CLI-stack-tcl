for {set i 0} {$i < 5} {incr i} {
    puts "i = $i"
}

# Step by 2
puts -nonewline "Evens: "
for {set i 0} {$i <= 10} {incr i 2} {
    puts -nonewline "$i "
}
puts ""

# Countdown
puts -nonewline "Countdown: "
for {set i 5} {$i >= 0} {incr i -1} {
    puts -nonewline "$i "
}
puts ""

# Nested — multiplication table
for {set r 1} {$r <= 3} {incr r} {
    for {set c 1} {$c <= 3} {incr c} {
        puts -nonewline [format "%4d" [expr {$r * $c}]]
    }
    puts ""
}
