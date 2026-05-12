# ============================================================
# 10_puts_format.tcl — Formatted output with puts and format
# ============================================================

set name  "Azman"
set score 95.5
set rank  1

# "format" works like printf/sprintf — returns a formatted string
# %-10s = left-aligned string in 10-char field
# %6.2f = float with 6 total width and 2 decimal places
# %d    = integer
puts [format "%-10s %6.2f  Rank: %d" $name $score $rank]

# Hex and octal formatting
puts [format "Hex: 0x%X  Oct: 0%o" 255 255]

# Scientific notation
puts [format "Sci: %e" 123456.789]

# Zero-padded integer
puts [format "Padded: %010d" 42]

# "puts" sends output to a specific channel (stdout or stderr)
# stderr is used for error/diagnostic messages
puts stderr "This goes to stderr"

# -nonewline suppresses the trailing newline
puts -nonewline "no newline "
puts "here"    ;# this continues on the same line
