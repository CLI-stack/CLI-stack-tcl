set scores [dict create Alice 95 Bob 60 Carol 82 Dave 45 Eve 91]

# Manual filter by value
set passing [dict create]
dict for {name score} $scores {
    if {$score >= 70} { dict set passing $name $score }
}
puts "Passing: $passing"

# Built-in filter by key pattern
set data [dict create server_a 1 server_b 2 client_a 3 client_b 4]
set servers [dict filter $data key server_*]
puts "Servers: $servers"

# Built-in filter by value glob
set high [dict filter $scores value 9*]
puts "High (9x): $high"

# Script form
set above80 [dict filter $scores script {k v} { expr {$v > 80} }]
puts "Above 80: $above80"
