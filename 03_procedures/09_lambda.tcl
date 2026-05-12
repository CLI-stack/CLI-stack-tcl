# ============================================================
# 09_lambda.tcl — Functional programming patterns: map/filter/reduce
# ============================================================

# "map" applies a lambda to every element and returns the transformed list
proc map {lambda lst} {
    set result {}
    foreach item $lst { lappend result [apply $lambda $item] }
    return $result
}

# "filter" keeps only elements for which the lambda returns true (1)
proc filter {lambda lst} {
    set result {}
    foreach item $lst {
        if {[apply $lambda $item]} { lappend result $item }
    }
    return $result
}

# "reduce" folds a list into a single value using a binary lambda
# acc = accumulator, starts at "init"
proc reduce {lambda init lst} {
    set acc $init
    foreach item $lst { set acc [apply $lambda $acc $item] }
    return $acc
}

set nums {1 2 3 4 5 6 7 8}

# {{x} {...}} is an inline lambda — arg list then body
puts "Squares:  [map    {{x}   { expr {$x*$x} }}        $nums]"
puts "Evens:    [filter {{x}   { expr {$x%2==0} }}       $nums]"
puts "Sum:      [reduce {{a x} { expr {$a+$x} }}   0     $nums]"   ;# starts at 0
puts "Product:  [reduce {{a x} { expr {$a*$x} }}   1     $nums]"   ;# starts at 1
