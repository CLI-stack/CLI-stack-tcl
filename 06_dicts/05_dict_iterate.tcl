# ============================================================
# 05_dict_iterate.tcl — Iterating over dictionaries
# ============================================================

set scores [dict create Alice 95 Bob 87 Carol 92 Dave 78]

# "dict for {keyVar valVar} dict { body }" is the cleanest iteration form
# Assigns each key and value to the named variables in turn
puts "dict for:"
dict for {name score} $scores {
    puts "  $name: $score"
}

# Alternatively, iterate over [dict keys] and use dict get inside
foreach name [dict keys $scores] {
    puts "$name -> [dict get $scores $name]"
}

# Find the highest scorer by iterating and tracking the max
set best_name ""
set best_score -1
dict for {name score} $scores {
    if {$score > $best_score} {
        set best_score $score
        set best_name $name
    }
}
puts "Best: $best_name ($best_score)"

# Filter: only print entries where the value satisfies a condition
puts "\nAbove 90:"
dict for {name score} $scores {
    if {$score > 90} { puts "  $name: $score" }
}
