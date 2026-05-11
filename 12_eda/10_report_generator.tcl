proc generate_closure_report {design passes} {
    set ts [clock format [clock seconds] -format "%Y-%m-%d %H:%M:%S"]
    set lines {}

    lappend lines "=========================================="
    lappend lines " TIMING CLOSURE REPORT"
    lappend lines " Design : $design"
    lappend lines " Date   : $ts"
    lappend lines "=========================================="
    lappend lines [format "%-6s %8s %8s %8s %8s  %-6s" Pass WNS(ns) TNS(ns) WHS(ns) DRC Status]
    lappend lines [string repeat "-" 52]

    foreach pass $passes {
        set pn  [dict get $pass pass]
        set wns [dict get $pass wns]
        set tns [dict get $pass tns]
        set whs [dict get $pass whs]
        set drc [dict get $pass drc]
        set ok  [expr {$wns >= 0 && $whs >= 0 && $drc == 0 ? "PASS" : "FAIL"}]
        lappend lines [format "%-6s %8.3f %8.3f %8.3f %8d  %-6s" $pn $wns $tns $whs $drc $ok]
    }

    lappend lines [string repeat "=" 42]
    return [join $lines "\n"]
}

set passes [list \
    [dict create pass Pass0 wns -0.450 tns -12.3 whs -0.020 drc 145] \
    [dict create pass Pass1 wns -0.120 tns  -3.1 whs  0.005 drc  42] \
    [dict create pass Pass2 wns  0.035 tns   0.0 whs  0.008 drc   0] \
]

puts [generate_closure_report "TOP_CHIP" $passes]
