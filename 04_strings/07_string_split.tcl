# ============================================================
# 07_string_split.tcl — Splitting strings into lists
# ============================================================

# "split str splitChars" splits the string at each occurrence of any splitChar
# Returns a TCL list of the resulting pieces
set csv "Alice,30,Engineer"
set parts [split $csv ","]        ;# split on comma
puts "Name: [lindex $parts 0]"   ;# first element
puts "Age:  [lindex $parts 1]"   ;# second element
puts "Job:  [lindex $parts 2]"   ;# third element

# Split into individual characters by using "" as the split chars
puts "Chars: [split hello {}]"   ;# {h e l l o}

# Splitting on whitespace (the default when no splitChars given)
# Handles multiple spaces, tabs, and newlines as one separator
set sentence "the quick brown fox"
set words [split $sentence]
puts "Words: $words  count=[llength $words]"

# Split on multiple delimiter characters at once
# Each character in the splitChars string is a separate delimiter
set data "a:b;c:d;e"
puts "Tokens: [split $data {:;}]"   ;# splits on both : and ;
