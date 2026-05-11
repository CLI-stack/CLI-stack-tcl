set scores [dict create Alice 95 Bob 87 Carol 92 Dave 78]

puts "dict for:"
dict for {name score} $scores {
    puts "  $name: $score"
}

set best_name ""
set best_score -1
dict for {name score} $scores {
    if {$score > $best_score} {
        set best_score $score
        set best_name $name
    }
}
puts "Best: $best_name ($best_score)"

puts "\nAbove 90:"
dict for {name score} $scores {
    if {$score > 90} { puts "  $name: $score" }
}
