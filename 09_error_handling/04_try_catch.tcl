try {
    set x [expr {10 / 2}]
    puts "Result: $x"
} on error {err} {
    puts "Error: $err"
} finally {
    puts "Finally block always runs"
}

# trap by error code
try {
    error "disk full" {} {POSIX ENOSPC}
} trap {POSIX ENOSPC} {err} {
    puts "Disk space error: $err"
} trap {POSIX} {err} {
    puts "Other POSIX error: $err"
} on error {err} {
    puts "Generic error: $err"
}

# Nested try with finally closing resource
proc process_file {path} {
    try {
        set fh [open $path r]
        try {
            return [read $fh]
        } finally {
            catch {close $fh}
        }
    } trap {} {err} {
        error "Cannot process $path: $err"
    }
}
if {[catch {process_file /etc/hostname} data]} {
    puts "Error: $data"
} else {
    puts "Read: [string trim $data]"
}
