# ============================================================
# 05_recursive_proc.tcl — Recursive procedures
# ============================================================

# Factorial: n! = n × (n-1)!  with base case 0! = 1! = 1
proc factorial {n} {
    if {$n <= 1} { return 1 }
    # Recursive call: proc calls itself with a smaller argument
    return [expr {$n * [factorial [expr {$n - 1}]]}]
}
puts "5!  = [factorial 5]"
puts "10! = [factorial 10]"

# Fibonacci: fib(n) = fib(n-1) + fib(n-2)  with fib(0)=0, fib(1)=1
proc fib {n} {
    if {$n <= 1} { return $n }   ;# base cases
    return [expr {[fib [expr {$n-1}]] + [fib [expr {$n-2}]]}]
}
puts -nonewline "Fib: "
for {set i 0} {$i <= 8} {incr i} { puts -nonewline "[fib $i] " }
puts ""

# Recursive list sum — processes head, recurses on tail
proc list_sum {lst} {
    if {[llength $lst] == 0} { return 0 }   ;# empty list base case
    # [lindex $lst 0] = first element; [lrange $lst 1 end] = rest of list
    return [expr {[lindex $lst 0] + [list_sum [lrange $lst 1 end]]}]
}
puts "Sum: [list_sum {1 2 3 4 5}]"
