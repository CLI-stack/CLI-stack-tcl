# ============================================================
# 03_regsub.tcl — Regex-based string substitution
# ============================================================

# "regsub pattern string replacement resultVar" replaces first match
# Returns the number of substitutions made
regsub {World} "Hello World" "TCL" result
puts $result   ;# Hello TCL

# -all replaces every occurrence, not just the first
regsub -all {aaa} "aaa bbb aaa ccc aaa" "XXX" result
puts $result   ;# XXX bbb XXX ccc XXX

# Strip HTML tags: <[^>]+> matches < then any chars except > then >
regsub -all {<[^>]+>} "<b>Hello</b> <i>World</i>" "" plain
puts "Plain: $plain"

# Normalize whitespace in two steps:
# 1. string trim removes leading/trailing whitespace
# 2. regsub -all replaces any internal run of whitespace with a single space
# \s matches any whitespace character (space, tab, newline)
regsub -all {\s+} [string trim "  hello    world  "] " " clean
puts "Clean: '$clean'"

# Back-references: \1 \2 etc. refer to captured groups in the replacement
# Here we reorder a date from YYYY-MM-DD to DD/MM/YYYY
regsub {(\d{4})-(\d{2})-(\d{2})} "2024-01-15" {\3/\2/\1} rearranged
puts "Rearranged: $rearranged"   ;# 15/01/2024
