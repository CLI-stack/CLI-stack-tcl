set i 0
while {$i < 5} {
    puts "i = $i"
    incr i
}

# While with break
set count 0
while {1} {
    incr count
    if {$count >= 3} break
}
puts "Broke at count: $count"

# do-while equivalent
set n 1
while {1} {
    puts "n = $n"
    incr n
    if {$n > 3} break
}
