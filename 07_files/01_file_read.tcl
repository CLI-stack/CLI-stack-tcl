set f "/tmp/tcl_read_demo.txt"
set fh [open $f w]
puts $fh "Line 1: Hello"
puts $fh "Line 2: World"
puts $fh "Line 3: TCL"
close $fh

# Read full file
set fh [open $f r]
set content [read $fh]
close $fh
puts "Full content:\n$content"

# Safe open
if {[catch {open /nonexistent.txt r} fh]} {
    puts "Error: $fh"
}

file delete $f
