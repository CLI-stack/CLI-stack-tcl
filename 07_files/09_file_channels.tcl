set f "/tmp/tcl_chan_demo.txt"

set fh [open $f w]
fconfigure $fh -buffering line
puts $fh "Line-buffered write"
flush $fh
close $fh

set fh [open $f r]
fconfigure $fh -encoding utf-8
set content [read $fh]
close $fh
puts "Read: [string trim $content]"

# Standard channels
puts "stdout encoding: [fconfigure stdout -encoding]"
puts "stdin  blocking: [fconfigure stdin  -blocking]"

file delete $f
