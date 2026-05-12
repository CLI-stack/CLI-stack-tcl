# ============================================================
# 09_dict_update.tcl — In-place dict modification
# ============================================================

set person [dict create name Alice age 30 score 85]

# "dict update dictVar k1 v1 k2 v2 { body }" creates local aliases
# v1 is bound to person[k1]; changes to v1 inside the body update the dict
dict update person age a score s {
    incr a     ;# increments person["age"] through alias "a"
    incr s 5   ;# increments person["score"] by 5 through alias "s"
}
puts "Updated: $person"

# Helper proc: increment a dict value, initializing to 0 if missing
# This is a very common pattern for frequency counting
proc dict_incr {dvar key {n 1}} {
    upvar 1 $dvar d
    if {![dict exists $d $key]} { dict set d $key 0 }
    dict incr d $key $n    ;# "dict incr" atomically increments an integer value
}

# Count word frequencies
set counts [dict create]
foreach word {a b a c a b} { dict_incr counts $word }
puts "Counts: $counts"   ;# a=3 b=2 c=1
