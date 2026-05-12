# ============================================================
# 09_list_to_string.tcl — Converting lists back to strings
# ============================================================

# "join lst separator" concatenates all list elements with the separator between them
set words {Hello beautiful World}
puts [join $words " "]     ;# "Hello beautiful World"
puts [join $words ", "]    ;# "Hello, beautiful, World"
puts [join $words ""]      ;# "HellobeautifulWorld"
puts [join {1 2 3 4 5} "+"]   ;# "1+2+3+4+5"

# Clever trick: build a math expression from a list and then evaluate it
set expr_str [join {1 2 3 4 5} "+"]
puts "Sum: [expr $expr_str]"   ;# expr evaluates "1+2+3+4+5" = 15

# Build a CSV row from a list of values
puts [join {Alice 30 Engineer} ","]   ;# "Alice,30,Engineer"

# Build a file path from components
puts "/[join {home user docs file.txt} /]"   ;# "/home/user/docs/file.txt"

# Round-trip: split then join should give back the original string
set orig "a:b:c:d"
puts "Same: [string equal $orig [join [split $orig :] :]]"   ;# 1 = true
