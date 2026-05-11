set person [dict create name Alice age 30 score 85]

dict update person age a score s {
    incr a
    incr s 5
}
puts "Updated: $person"

# Word-frequency counter
proc dict_incr {dvar key {n 1}} {
    upvar 1 $dvar d
    if {![dict exists $d $key]} { dict set d $key 0 }
    dict incr d $key $n
}

set counts [dict create]
foreach word {a b a c a b} { dict_incr counts $word }
puts "Counts: $counts"
