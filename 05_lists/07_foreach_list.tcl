# ============================================================
# 07_foreach_list.tcl — Iterating over and transforming lists
# ============================================================

# Manual index tracking with foreach (TCL has no enumerate built-in)
set fruits {apple banana cherry}
set i 0
foreach fruit $fruits {
    puts "$i: $fruit"
    incr i
}

# "lmap" (TCL 8.6+) transforms every element and collects the results
# Equivalent to Python's list comprehension or map()
set nums {1 2 3 4 5}
set sq [lmap n $nums { expr {$n * $n} }]
puts "Squared: $sq"

# Manual filter using foreach + lappend
set data {1 -2 3 -4 5}
set pos {}
foreach n $data { if {$n > 0} { lappend pos $n } }
puts "Positives: $pos"

# Use lsearch -regexp to filter by pattern (avoids manual foreach)
set words {hello world foo bar}
set long [lsearch -all -inline -regexp $words {.{5,}}]  ;# 5+ chars
puts "Long words: $long"
