set fruits {apple banana cherry mango}
foreach fruit $fruits {
    puts "Fruit: $fruit"
}

# Two variables per step
set pairs {a 1 b 2 c 3}
foreach {key val} $pairs {
    puts "$key -> $val"
}

# Parallel lists
set names  {Alice Bob Carol}
set scores {95 87 92}
foreach name $names score $scores {
    puts "$name: $score"
}

# Nested foreach
set matrix {{1 2 3} {4 5 6} {7 8 9}}
foreach row $matrix {
    foreach val $row { puts -nonewline "$val " }
    puts ""
}
