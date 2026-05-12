# ============================================================
# 08_dict_filter.tcl — Filtering dictionaries
# ============================================================

set scores [dict create Alice 95 Bob 60 Carol 82 Dave 45 Eve 91]

# Manual filter: iterate and copy matching entries to a new dict
set passing [dict create]
dict for {name score} $scores {
    if {$score >= 70} { dict set passing $name $score }
}
puts "Passing: $passing"

# "dict filter dict key pattern" keeps only entries whose KEY matches a glob
set data [dict create server_a 1 server_b 2 client_a 3 client_b 4]
set servers [dict filter $data key server_*]
puts "Servers: $servers"

# "dict filter dict value pattern" keeps entries whose VALUE matches a glob
set high [dict filter $scores value 9*]   ;# values starting with 9
puts "High (9x): $high"

# "dict filter dict script {kVar vVar} { body }" — most flexible form
# Keeps entries for which the body returns true (non-zero)
set above80 [dict filter $scores script {k v} { expr {$v > 80} }]
puts "Above 80: $above80"
