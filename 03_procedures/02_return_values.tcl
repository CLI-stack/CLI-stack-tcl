proc safe_divide {a b} {
    if {$b == 0} { return -1 }
    return [expr {$a / double($b)}]
}
puts [safe_divide 10 3]
puts [safe_divide 5 0]

# Return a list
proc minmax {lst} {
    set s [lsort -integer $lst]
    return [list [lindex $s 0] [lindex $s end]]
}
lassign [minmax {5 2 8 1 9 3}] mn mx
puts "Min=$mn  Max=$mx"

# Return a dict
proc make_user {name age} {
    return [dict create name $name age $age]
}
set u [make_user "Alice" 30]
puts "Name=[dict get $u name]  Age=[dict get $u age]"
