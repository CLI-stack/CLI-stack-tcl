puts -nonewline "break at 5: "
for {set i 0} {$i < 10} {incr i} {
    if {$i == 5} break
    puts -nonewline "$i "
}
puts ""

puts -nonewline "odd only: "
for {set i 0} {$i < 10} {incr i} {
    if {$i % 2 == 0} continue
    puts -nonewline "$i "
}
puts ""

# break only exits innermost loop
puts "nested break:"
for {set i 0} {$i < 3} {incr i} {
    for {set j 0} {$j < 3} {incr j} {
        if {$j == 1} break
        puts "  ($i,$j)"
    }
}
