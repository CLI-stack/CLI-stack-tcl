# ============================================================
# 05_batch_processing.tcl — Batch PnR run simulation and reporting
# ============================================================

# Simulate running PnR on multiple designs and collecting results
proc process_designs {design_list} {
    set results [dict create]

    foreach design $design_list {
        puts "Processing: $design"

        # In a real flow, replace this block with:
        #   exec icc2_shell -f ${design}.tcl > ${design}.log
        # Here we simulate with random results
        set status [expr {rand() > 0.2 ? "PASS" : "FAIL"}]
        set wns    [format "%.3f" [expr {rand() * 0.5 - 0.1}]]   ;# worst negative slack
        set drc    [expr {int(rand() * 100)}]                     ;# DRC violation count

        dict set results $design status $status
        dict set results $design wns    $wns
        dict set results $design drc    $drc
        puts "  => $status  WNS=$wns  DRC=$drc"
    }
    return $results
}

set results [process_designs {CORE MACRO_A MACRO_B TOP}]

# Print a formatted summary table
puts "\n=== Summary ==="
puts [format "%-12s %-6s %8s %6s" Design Status WNS DRC]
puts [string repeat "-" 36]
dict for {d info} $results {
    puts [format "%-12s %-6s %8s %6d" \
        $d \
        [dict get $info status] \
        [dict get $info wns] \
        [dict get $info drc]]
}
