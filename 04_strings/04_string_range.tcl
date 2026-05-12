# ============================================================
# 04_string_range.tcl — Extracting substrings
# ============================================================

set s "Hello, World!"

# "string range str first last" extracts characters from index first to last (inclusive)
puts [string range $s 0 4]          ;# "Hello"    — indices 0..4
puts [string range $s 7 11]         ;# "World"    — indices 7..11
puts [string range $s 7 end]        ;# "World!"   — from 7 to end of string
puts [string range $s end-5 end]    ;# "orld!"    — last 5 characters

# Practical example: extract a value from a "key=value;key2=value2" string
set line "name=Alice;age=30"

# Find the positions of = and ; to know where the value starts and ends
set eq   [string first "=" $line]      ;# index of first =
set semi [string first ";" $line]      ;# index of ;

# Value is between the = and the ; (exclusive of both delimiters)
set name [string range $line [expr {$eq+1}] [expr {$semi-1}]]
puts "Name: $name"   ;# Alice
