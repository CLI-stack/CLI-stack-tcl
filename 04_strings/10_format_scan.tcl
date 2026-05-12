# ============================================================
# 10_format_scan.tcl — Formatted strings with format and scan
# ============================================================

# "format" works like C's sprintf — builds a formatted string
# %-10s = left-align string in 10-char field
# %5d   = right-align integer in 5-char field
# %8.2f = float with total 8 chars width and 2 decimal places
puts [format "%-10s %5d %8.2f" "Alice" 30 95.5]
puts [format "%-10s %5d %8.2f" "Bob"   25 87.3]

# Build a simple bar chart using format for alignment
for {set i 1} {$i <= 5} {incr i} {
    # %3d = 3-char wide integer; string repeat makes the bar
    puts [format "%3d: %s" $i [string repeat "*" $i]]
}

# "scan" works like C's sscanf — parses a formatted string into variables
# It returns the number of successfully matched fields
set line "Alice 30 95.5"
scan $line "%s %d %f" name age score
puts "Name=$name  Age=$age  Score=$score"

# Parse structured data with named placeholders
set data "X=42 Y=100"
scan $data "X=%d Y=%d" x y
puts "x=$x  y=$y"
