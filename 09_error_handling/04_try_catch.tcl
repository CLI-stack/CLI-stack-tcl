# ============================================================
# 04_try_catch.tcl — Structured error handling with try (TCL 8.6+)
# ============================================================

# "try" is a modern replacement for catch — cleaner, more structured
# "on error" handles any error; "finally" always runs (cleanup)
try {
    set x [expr {10 / 2}]
    puts "Result: $x"
} on error {err} {
    puts "Error: $err"
} finally {
    puts "Finally block always runs"   ;# runs whether success or failure
}

# "trap errorCode" handles specific error types — like typed exceptions
# The error code is matched as a list prefix
try {
    error "disk full" {} {POSIX ENOSPC}   ;# throw with POSIX ENOSPC code
} trap {POSIX ENOSPC} {err} {
    puts "Disk space error: $err"   ;# catches only ENOSPC
} trap {POSIX} {err} {
    puts "Other POSIX error: $err"  ;# catches any other POSIX error
} on error {err} {
    puts "Generic error: $err"      ;# fallback for anything else
}

# Nested try with finally ensures file handle is always closed
proc process_file {path} {
    try {
        set fh [open $path r]
        try {
            return [read $fh]
        } finally {
            catch {close $fh}   ;# close even if read failed
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
