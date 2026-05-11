proc categorize_drc {violations} {
    set cats [dict create]
    foreach v $violations {
        set rule [dict get $v rule]
        set type [lindex [split $rule "_"] 0]
        if {![dict exists $cats $type]} {
            dict set cats $type [dict create count 0 violations {}]
        }
        dict update cats $type sub {
            dict incr sub count
            dict lappend sub violations $v
        }
    }
    return $cats
}

proc print_drc_summary {cats} {
    puts [format "%-15s %8s" "Rule Type" "Count"]
    puts [string repeat "-" 25]
    set total 0
    foreach type [lsort [dict keys $cats]] {
        set n [dict get $cats $type count]
        incr total $n
        puts [format "%-15s %8d" $type $n]
    }
    puts [string repeat "-" 25]
    puts [format "%-15s %8d" "TOTAL" $total]
    return $total
}

set viols [list \
    [dict create rule METAL_width   layer M1] \
    [dict create rule METAL_space   layer M1] \
    [dict create rule VIA_cover     layer V1] \
    [dict create rule METAL_space   layer M2] \
    [dict create rule VIA_size      layer V2] \
    [dict create rule METAL_density layer M3] \
]

set total [print_drc_summary [categorize_drc $viols]]
puts "\nDRC [expr {$total > 0 ? {FAILED} : {PASSED}}]"
