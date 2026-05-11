set date  [clock format [clock seconds] -format "%Y-%m-%d"]
set upper [string toupper "hello world"]
set len   [string length [string trim "  hello  "]]

puts "Date:    $date"
puts "Upper:   $upper"
puts "Trimmed length: $len"

# Nested substitution
puts "PI digits: [string length [expr {3.14159265358979}]]"

# Command in string
puts "There are [llength {a b c d e}] items"
