# ============================================================
# 01_catch_basic.tcl — Handling errors with catch
# ============================================================

# "catch script ?resultVar?" runs script and catches any error
# Returns 0 on success (resultVar = script result)
# Returns 1 on error   (resultVar = error message)
if {[catch {expr {1/0}} err]} {
    puts "Caught: $err"   ;# division by zero message
}

# Safe file open: avoid crashing if the file doesn't exist
if {[catch {open /nonexistent.txt r} fh]} {
    puts "File error: $fh"   ;# error message stored in fh on failure
} else {
    close $fh
}

# Wrap a risky operation in a proc for clean error handling
proc safe_divide {a b} {
    if {[catch {expr {$a / $b}} result]} { return -1 }   ;# -1 = error sentinel
    return $result
}
puts [safe_divide 10 2]   ;# 5
puts [safe_divide 10 0]   ;# -1 (caught division by zero)

# Test multiple values and handle success/failure differently
proc might_fail {x} {
    if {$x < 0} { error "Negative: $x" }   ;# "error" throws an exception
    return [expr {$x * 2}]
}
foreach val {5 -3 10} {
    if {[catch {might_fail $val} result]} {
        puts "Failed $val: $result"
    } else {
        puts "OK $val: $result"
    }
}
