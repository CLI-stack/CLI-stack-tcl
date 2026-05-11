puts "Multiplication table (5x5):"
for {set i 1} {$i <= 5} {incr i} {
    for {set j 1} {$j <= 5} {incr j} {
        puts -nonewline [format "%4d" [expr {$i * $j}]]
    }
    puts ""
}

puts "\nTriangle:"
for {set i 1} {$i <= 5} {incr i} {
    puts [string repeat "* " $i]
}

puts "\nNested foreach — person records:"
set data {{Alice 25} {Bob 30} {Carol 28}}
foreach person $data {
    lassign $person name age
    puts "  $name is $age years old"
}
