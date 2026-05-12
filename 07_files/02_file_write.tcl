# ============================================================
# 02_file_write.tcl — Writing content to files
# ============================================================

set f "/tmp/tcl_write_demo.txt"

# Mode "w" creates the file (or truncates if it exists) for writing
set fh [open $f w]
puts $fh "First line"
puts $fh "Second line"
# Write formatted content using format
puts $fh [format "Formatted: %05d" 42]
close $fh   ;# flush buffers and release the file descriptor

# Verify by reading back
set fh [open $f r]
puts [read $fh]
close $fh

file delete $f
