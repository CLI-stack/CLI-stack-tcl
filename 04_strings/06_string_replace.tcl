# ============================================================
# 06_string_replace.tcl — Replacing parts of strings
# ============================================================

set s "Hello, World!"

# "string replace str first last ?newstr?" replaces characters first..last
# with newstr (or deletes them if newstr is omitted)
puts [string replace $s 7 11 "TCL"]     ;# "Hello, TCL!"   — replace "World"
puts [string replace $s 0 4 "Goodbye"]  ;# "Goodbye, World!"
puts [string replace $s 5 6 ""]         ;# "HelloWorld!"    — delete ", "

# "regsub" does pattern-based (regex) substitution
# -all replaces every occurrence, not just the first
# Curly braces prevent substitution of $ inside the pattern
set text {price is $100 and $200}
regsub -all {\$[0-9]+} $text "PRICE" result   ;# replace dollar amounts
puts $result

# Replace all occurrences of a single character
regsub -all {b} "aabbcc" "X" result
puts $result   ;# aaXXcc

# Normalize whitespace: replace runs of whitespace with a single space
# [string trim] removes leading/trailing spaces first
regsub -all {\s+} [string trim "  hello    world  "] " " clean
puts "Clean: '$clean'"
