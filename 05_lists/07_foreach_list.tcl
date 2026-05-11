set fruits {apple banana cherry}
set i 0
foreach fruit $fruits {
    puts "$i: $fruit"
    incr i
}

# lmap — transform (TCL 8.6+)
set nums {1 2 3 4 5}
set sq [lmap n $nums { expr {$n * $n} }]
puts "Squared: $sq"

# Manual filter
set data {1 -2 3 -4 5}
set pos {}
foreach n $data { if {$n > 0} { lappend pos $n } }
puts "Positives: $pos"

# Long words
set words {hello world foo bar}
set long [lsearch -all -inline -regexp $words {.{5,}}]
puts "Long words: $long"
