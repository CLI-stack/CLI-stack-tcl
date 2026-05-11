proc parse_power_report {text} {
    set result [dict create]
    foreach line [split $text "\n"] {
        set line [string trim $line]
        if {[regexp {Internal\s+Power:\s+([\d.]+)} $line -> v]} { dict set result internal $v }
        if {[regexp {Switching\s+Power:\s+([\d.]+)} $line -> v]} { dict set result switching $v }
        if {[regexp {Leakage\s+Power:\s+([\d.]+)}  $line -> v]} { dict set result leakage  $v }
        if {[regexp {Total\s+Power:\s+([\d.]+)}    $line -> v]} { dict set result total    $v }
    }
    return $result
}

proc power_budget_check {report budget} {
    set total [dict get $report total]
    set margin [expr {$budget - $total}]
    set pct    [format "%.1f" [expr {100.0 * $total / $budget}]]

    puts [format "Budget: %6.1f mW" $budget]
    puts [format "Total:  %6.1f mW (%s%%)" $total $pct]
    puts [format "Margin: %6.3f mW" $margin]
    puts "Status: [expr {$margin >= 0 ? {PASS} : {FAIL}}]"
}

set sample {
    Internal  Power: 125.3
    Switching Power:  87.5
    Leakage   Power:   2.1
    Total     Power: 214.9
}

set rpt [parse_power_report $sample]
puts "Parsed: $rpt\n"
power_budget_check $rpt 250.0
