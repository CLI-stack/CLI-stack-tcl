set logfile "/tmp/tcl_log_demo.txt"

proc log_msg {file msg} {
    set ts [clock format [clock seconds] -format "%Y-%m-%d %H:%M:%S"]
    set fh [open $file a]
    puts $fh "$ts  $msg"
    close $fh
}

log_msg $logfile "Application started"
log_msg $logfile "Processing data"
log_msg $logfile "Done"

set fh [open $logfile r]
puts [read $fh]
close $fh

file delete $logfile
