# ============================================================
# 05_file_lines.tcl — Reading files line by line
# ============================================================

set f "/tmp/tcl_lines_demo.txt"

# Create a test file with several lines
set fh [open $f w]
for {set i 1} {$i <= 5} {incr i} {
    puts $fh "Line $i: [string repeat x $i]"
}
close $fh

# Method 1: line-by-line using "gets"
# "gets fh varname" reads one line into varname, returns length (-1 at EOF)
set fh [open $f r]
set n 0
while {[gets $fh line] >= 0} {   ;# loop until EOF (-1 returned)
    incr n
    puts "  $n: $line"
}
close $fh

# Method 2: read everything then split into a list of lines
# Faster for small files; uses more memory for large ones
set fh [open $f r]
set lines [split [read $fh] "\n"]   ;# split on newline character
close $fh
puts "Total lines: [llength $lines]"
puts "Line 3: [lindex $lines 2]"    ;# 0-based index

file delete $f
