set nums {1 2 3 4 5 6 7 8 9 10}

set doubled  [lmap n $nums { expr {$n * 2} }]
set strs     [lmap n $nums { format "item_%02d" $n }]
puts "Doubled: $doubled"
puts "Strings: $strs"

proc lfilter {lst pred} {
    set result {}
    foreach item $lst {
        if {[apply $pred $item]} { lappend result $item }
    }
    return $result
}

set evens [lfilter $nums {{x} { expr {$x % 2 == 0} }}]
set big   [lfilter $nums {{x} { expr {$x > 5} }}]
puts "Evens: $evens"
puts "Big:   $big"

# Chain
set even_squares [lmap n [lfilter $nums {{x} { expr {$x%2==0} }}] { expr {$n*$n} }]
puts "Even squares: $even_squares"
