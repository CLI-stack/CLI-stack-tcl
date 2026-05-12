# ============================================================
# 01_file_read.tcl — Reading file contents
# ============================================================

set f "/tmp/tcl_read_demo.txt"

# First create a test file to read
set fh [open $f w]          ;# "open" with mode "w" creates/overwrites the file
puts $fh "Line 1: Hello"    ;# "puts fh string" writes to the file channel
puts $fh "Line 2: World"
puts $fh "Line 3: TCL"
close $fh                   ;# always close the file handle when done

# Read entire file content at once into a string
set fh [open $f r]          ;# mode "r" opens for reading
set content [read $fh]      ;# "read" reads the entire file into a string
close $fh
puts "Full content:\n$content"

# Safe open: use "catch" to handle errors without crashing
# catch returns 0 on success, 1 on error
if {[catch {open /nonexistent.txt r} fh]} {
    puts "Error: $fh"   ;# fh contains the error message on failure
}

file delete $f   ;# clean up the temp file
