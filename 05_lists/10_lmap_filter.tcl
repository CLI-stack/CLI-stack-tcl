# ============================================================
# 10_lmap_filter.tcl — Functional list operations
# ============================================================

set nums {1 2 3 4 5 6 7 8 9 10}

# "lmap" applies a transformation to each element, returning a new list
# The body is evaluated for each element; the result is collected
set doubled  [lmap n $nums { expr {$n * 2} }]
set strs     [lmap n $nums { format "item_%02d" $n }]   ;# format each as item_01, item_02...
puts "Doubled: $doubled"
puts "Strings: $strs"

# Custom filter proc using apply with a lambda predicate
proc lfilter {lst pred} {
    set result {}
    foreach item $lst {
        # "apply pred item" calls the lambda with the item as argument
        if {[apply $pred $item]} { lappend result $item }
    }
    return $result
}

# {{x} { body }} is an inline lambda — {x} is arg list, rest is body
set evens [lfilter $nums {{x} { expr {$x % 2 == 0} }}]
set big   [lfilter $nums {{x} { expr {$x > 5} }}]
puts "Evens: $evens"
puts "Big:   $big"

# Chain lfilter and lmap: filter evens, then square each
set even_squares [lmap n [lfilter $nums {{x} { expr {$x%2==0} }}] { expr {$n*$n} }]
puts "Even squares: $even_squares"
