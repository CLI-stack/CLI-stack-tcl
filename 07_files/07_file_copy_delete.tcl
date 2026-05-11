set src "/tmp/tcl_src_demo.txt"
set dst "/tmp/tcl_dst_demo.txt"
set mv  "/tmp/tcl_mv_demo.txt"

set fh [open $src w]
puts $fh "Source content"
close $fh

file copy $src $dst
puts "Copied:   [file exists $dst]"

file copy -force $src $dst
puts "Overwrite OK"

file rename $dst $mv
puts "Moved:    [file exists $mv]"
puts "Dst gone: [expr {![file exists $dst]}]"

file delete $src $mv
puts "Deleted.  src exists: [file exists $src]"
