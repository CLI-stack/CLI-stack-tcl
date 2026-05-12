# ============================================================
# 03_file_append.tcl — Appending to files (logging pattern)
# ============================================================

set logfile "/tmp/tcl_log_demo.txt"

# A logging helper — mode "a" opens the file for appending
# Existing content is preserved; new writes go to the end
proc log_msg {file msg} {
    # [clock format [clock seconds]] formats the current time
    set ts [clock format [clock seconds] -format "%Y-%m-%d %H:%M:%S"]
    set fh [open $file a]   ;# "a" = append mode; creates file if needed
    puts $fh "$ts  $msg"
    close $fh
}

log_msg $logfile "Application started"
log_msg $logfile "Processing data"
log_msg $logfile "Done"

# Read back and display all log entries
set fh [open $logfile r]
puts [read $fh]
close $fh

file delete $logfile
