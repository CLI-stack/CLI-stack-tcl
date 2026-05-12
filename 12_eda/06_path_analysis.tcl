# ============================================================
# 06_path_analysis.tcl — Categorize timing paths by slack severity
# ============================================================

# Classify each path as failing, critical, or passing
# "threshold" defines the boundary between failing and critical
proc analyze_paths {paths {threshold -0.1}} {
    set failing  {}
    set critical {}
    set passing  {}

    foreach path $paths {
        set slack [dict get $path slack]
        if {$slack < $threshold} {
            lappend failing $path    ;# severe violation (worse than threshold)
        } elseif {$slack < 0} {
            lappend critical $path   ;# marginal violation (between threshold and 0)
        } else {
            lappend passing $path    ;# no violation
        }
    }

    return [dict create failing $failing critical $critical passing $passing]
}

proc path_summary {results} {
    set f [llength [dict get $results failing]]
    set c [llength [dict get $results critical]]
    set p [llength [dict get $results passing]]
    puts "Passing=$p  Critical=$c  Failing=$f"

    # Print details for failing paths only
    if {$f > 0} {
        puts "Failing paths:"
        foreach path [dict get $results failing] {
            puts "  [dict get $path name]: [dict get $path slack]"
        }
    }
}

# Sample paths: mix of passing, critical (small negative), and failing (large negative)
set paths [list \
    [dict create name path_a slack  0.350] \
    [dict create name path_b slack -0.050] \
    [dict create name path_c slack -0.250] \
    [dict create name path_d slack  0.120] \
    [dict create name path_e slack -0.015] \
]

path_summary [analyze_paths $paths]
