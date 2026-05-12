# ============================================================
# 03_error_throw.tcl — Throwing errors from procedures
# ============================================================

# "error message ?info? ?code?" throws an exception
# The caller can catch it with "catch" or "try/trap"
proc validate_age {age} {
    if {![string is integer $age]} {
        error "Age must be integer, got: $age"   ;# throw with message
    }
    if {$age < 0 || $age > 150} {
        error "Age out of range: $age"
    }
    return $age   ;# only reaches here if valid
}

foreach test {25 -5 abc 200} {
    if {[catch {validate_age $test} result]} {
        puts "Invalid '$test': $result"   ;# caught the thrown error
    } else {
        puts "Valid: $result"
    }
}

# "error message info code" sets the machine-readable error code
# The code is a list — useful for structured error handling with "trap"
proc open_config {path} {
    if {![file exists $path]} {
        error "Config not found: $path" {} {CONFIG NOTFOUND}
        #                         ^      ^--- error code (list)
        #                         +--- additional info (empty = use default trace)
    }
}
catch {open_config /no.cfg} err opts
puts "\nCode: [dict get $opts -errorcode]"   ;# CONFIG NOTFOUND
puts "Msg:  $err"
