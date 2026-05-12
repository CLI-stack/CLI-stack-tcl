# ============================================================
# 02_return_values.tcl — Returning values from procedures
# ============================================================

# Return a scalar — -1 used as an error sentinel here
proc safe_divide {a b} {
    if {$b == 0} { return -1 }          ;# early return to avoid division by zero
    return [expr {$a / double($b)}]      ;# normal return
}
puts [safe_divide 10 3]
puts [safe_divide 5 0]    ;# returns -1

# Return a list — multiple values packed into one return
proc minmax {lst} {
    set s [lsort -integer $lst]          ;# sort numerically
    return [list [lindex $s 0] [lindex $s end]]   ;# return {min max}
}
# lassign unpacks the returned list into two variables
lassign [minmax {5 2 8 1 9 3}] mn mx
puts "Min=$mn  Max=$mx"

# Return a dict — structured data as a return value
proc make_user {name age} {
    return [dict create name $name age $age]
}
set u [make_user "Alice" 30]
# [dict get] extracts a value by key
puts "Name=[dict get $u name]  Age=[dict get $u age]"
