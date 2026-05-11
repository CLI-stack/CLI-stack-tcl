proc factorial {n} {
    if {$n <= 1} { return 1 }
    return [expr {$n * [factorial [expr {$n - 1}]]}]
}
puts "5!  = [factorial 5]"
puts "10! = [factorial 10]"

proc fib {n} {
    if {$n <= 1} { return $n }
    return [expr {[fib [expr {$n-1}]] + [fib [expr {$n-2}]]}]
}
puts -nonewline "Fib: "
for {set i 0} {$i <= 8} {incr i} { puts -nonewline "[fib $i] " }
puts ""

proc list_sum {lst} {
    if {[llength $lst] == 0} { return 0 }
    return [expr {[lindex $lst 0] + [list_sum [lrange $lst 1 end]]}]
}
puts "Sum: [list_sum {1 2 3 4 5}]"
