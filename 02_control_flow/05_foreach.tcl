# ============================================================
# 05_foreach.tcl — Iterating over lists
# ============================================================

# foreach iterates over every element in a list
set fruits {apple banana cherry mango}
foreach fruit $fruits {
    puts "Fruit: $fruit"
}

# Two loop variables per step: consumes two elements at a time
# Useful for processing key-value flat lists
set pairs {a 1 b 2 c 3}
foreach {key val} $pairs {
    puts "$key -> $val"
}

# Parallel iteration over multiple lists simultaneously
# When one list runs out, its variable gets an empty string
set names  {Alice Bob Carol}
set scores {95 87 92}
foreach name $names score $scores {
    puts "$name: $score"
}

# Nested foreach — outer list contains sublists (a matrix)
set matrix {{1 2 3} {4 5 6} {7 8 9}}
foreach row $matrix {
    foreach val $row { puts -nonewline "$val " }
    puts ""   ;# newline after each row
}
