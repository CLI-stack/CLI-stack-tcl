# ============================================================
# 07_file_copy_delete.tcl — Copying, moving, and deleting files
# ============================================================

set src "/tmp/tcl_src_demo.txt"
set dst "/tmp/tcl_dst_demo.txt"
set mv  "/tmp/tcl_mv_demo.txt"

# Create a source file to work with
set fh [open $src w]
puts $fh "Source content"
close $fh

# "file copy src dst" copies src to dst (dst must not exist)
file copy $src $dst
puts "Copied:   [file exists $dst]"   ;# 1 = exists

# -force overwrites the destination if it already exists
file copy -force $src $dst
puts "Overwrite OK"

# "file rename src dst" moves/renames src to dst
file rename $dst $mv
puts "Moved:    [file exists $mv]"
puts "Dst gone: [expr {![file exists $dst]}]"   ;# dst no longer exists

# "file delete" removes one or more files
file delete $src $mv
puts "Deleted.  src exists: [file exists $src]"
