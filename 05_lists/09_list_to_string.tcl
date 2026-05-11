set words {Hello beautiful World}
puts [join $words " "]
puts [join $words ", "]
puts [join $words ""]
puts [join {1 2 3 4 5} "+"]

# Evaluate joined expression
set expr_str [join {1 2 3 4 5} "+"]
puts "Sum: [expr $expr_str]"

# Build CSV row
puts [join {Alice 30 Engineer} ","]

# Build path
puts "/[join {home user docs file.txt} /]"

# Round-trip split->join
set orig "a:b:c:d"
puts "Same: [string equal $orig [join [split $orig :] :]]"
