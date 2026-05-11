set s "Hello, World!"

puts [string replace $s 7 11 "TCL"]     ;# Hello, TCL!
puts [string replace $s 0 4 "Goodbye"]  ;# Goodbye, World!
puts [string replace $s 5 6 ""]         ;# HelloWorld!

# Pattern-based replacement
set text {price is $100 and $200}
regsub -all {\$[0-9]+} $text "PRICE" result
puts $result

# Replace all occurrences
regsub -all {b} "aabbcc" "X" result
puts $result   ;# aaXXcc

# Normalize whitespace
regsub -all {\s+} [string trim "  hello    world  "] " " clean
puts "'$clean'"
