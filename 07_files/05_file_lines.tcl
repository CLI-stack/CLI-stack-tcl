set f "/tmp/tcl_lines_demo.txt"
set fh [open $f w]
for {set i 1} {$i <= 5} {incr i} {
    puts $fh "Line $i: [string repeat x $i]"
}
close $fh

# Line-by-line with gets
set fh [open $f r]
set n 0
while {[gets $fh line] >= 0} {
    incr n
    puts "  $n: $line"
}
close $fh

# All lines as list
set fh [open $f r]
set lines [split [read $fh] "\n"]
close $fh
puts "Total lines: [llength $lines]"
puts "Line 3: [lindex $lines 2]"

file delete $f
