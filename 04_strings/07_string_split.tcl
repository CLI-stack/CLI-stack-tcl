set csv "Alice,30,Engineer"
set parts [split $csv ","]
puts "Name: [lindex $parts 0]"
puts "Age:  [lindex $parts 1]"
puts "Job:  [lindex $parts 2]"

# Split into characters
puts "Chars: [split hello {}]"

# Split on whitespace (default)
set sentence "the quick brown fox"
set words [split $sentence]
puts "Words: $words  count=[llength $words]"

# Multiple delimiter chars
set data "a:b;c:d;e"
puts "Tokens: [split $data {:;}]"
