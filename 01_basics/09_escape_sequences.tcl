# ============================================================
# 09_escape_sequences.tcl — Backslash escape sequences
# ============================================================

# Escape sequences work inside double-quoted strings
puts "Tab:\there"          ;# \t = horizontal tab
puts "Newline:\nnext line" ;# \n = newline character
puts "Quote: \"quoted\""   ;# \" = literal double-quote inside a string
puts "Backslash: \\"       ;# \\ = literal backslash
puts "Hex 41: \x41"        ;# \xNN = character by hex code (0x41 = 'A')

# Curly braces { } suppress ALL substitution and escape processing
# Backslashes and $ are treated as plain text — useful for raw patterns
puts {No escape: \n \t $var [command]}

# Backslash-newline joins two physical lines into one logical line
# Useful for writing long strings across multiple lines
set long "first \
second \
third"
puts $long
