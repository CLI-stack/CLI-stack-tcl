# ============================================================
# 09_file_channels.tcl — Channel configuration and buffering
# ============================================================

set f "/tmp/tcl_chan_demo.txt"

# Open with explicit buffering control
set fh [open $f w]
# "fconfigure" sets channel options
# -buffering line: flush automatically after each newline
# Other options: full (default), none (flush every write)
fconfigure $fh -buffering line
puts $fh "Line-buffered write"
flush $fh    ;# explicit flush sends any remaining buffered data immediately
close $fh

# Configure encoding when reading (important for non-ASCII files)
set fh [open $f r]
fconfigure $fh -encoding utf-8    ;# interpret bytes as UTF-8 text
set content [read $fh]
close $fh
puts "Read: [string trim $content]"

# Standard channels (always available, no need to open)
# stdout, stdin, stderr are pre-opened channel objects
puts "stdout encoding: [fconfigure stdout -encoding]"
puts "stdin  blocking: [fconfigure stdin  -blocking]"

file delete $f
