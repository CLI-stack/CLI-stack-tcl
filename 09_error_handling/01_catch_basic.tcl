if {[catch {expr {1/0}} err]} {
    puts "Caught: $err"
}

if {[catch {open /nonexistent.txt r} fh]} {
    puts "File error: $fh"
} else {
    close $fh
}

proc safe_divide {a b} {
    if {[catch {expr {$a / $b}} result]} { return -1 }
    return $result
}
puts [safe_divide 10 2]
puts [safe_divide 10 0]

proc might_fail {x} {
    if {$x < 0} { error "Negative: $x" }
    return [expr {$x * 2}]
}
foreach val {5 -3 10} {
    if {[catch {might_fail $val} result]} {
        puts "Failed $val: $result"
    } else {
        puts "OK $val: $result"
    }
}
