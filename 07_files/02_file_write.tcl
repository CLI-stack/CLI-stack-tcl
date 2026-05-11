set f "/tmp/tcl_write_demo.txt"

set fh [open $f w]
puts $fh "First line"
puts $fh "Second line"
puts $fh [format "Formatted: %05d" 42]
close $fh

set fh [open $f r]
puts [read $fh]
close $fh

file delete $f
