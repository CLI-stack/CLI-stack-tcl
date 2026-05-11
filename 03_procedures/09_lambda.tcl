proc map {lambda lst} {
    set result {}
    foreach item $lst { lappend result [apply $lambda $item] }
    return $result
}

proc filter {lambda lst} {
    set result {}
    foreach item $lst {
        if {[apply $lambda $item]} { lappend result $item }
    }
    return $result
}

proc reduce {lambda init lst} {
    set acc $init
    foreach item $lst { set acc [apply $lambda $acc $item] }
    return $acc
}

set nums {1 2 3 4 5 6 7 8}
puts "Squares:  [map    {{x}   { expr {$x*$x} }}        $nums]"
puts "Evens:    [filter {{x}   { expr {$x%2==0} }}       $nums]"
puts "Sum:      [reduce {{a x} { expr {$a+$x} }}   0     $nums]"
puts "Product:  [reduce {{a x} { expr {$a*$x} }}   1     $nums]"
