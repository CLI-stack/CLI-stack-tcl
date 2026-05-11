proc make_clock {name period {unc 0.05} {trans 0.02}} {
    return [dict create \
        name        $name \
        period      $period \
        frequency   [expr {1000.0 / $period}] \
        uncertainty $unc \
        transition  $trans \
    ]
}

proc clock_to_sdc {spec} {
    dict with spec {
        set lines {}
        lappend lines "create_clock -period $period -name $name \[get_ports ${name}_clk\]"
        lappend lines "set_clock_uncertainty $uncertainty \[get_clocks $name\]"
        lappend lines "set_clock_transition  $transition  \[get_clocks $name\]"
        return [join $lines "\n"]
    }
}

proc clock_relationship {ck1 ck2} {
    set r [expr {[dict get $ck2 period] / [dict get $ck1 period]}]
    if {abs($r - round($r)) < 0.001} {
        return "synchronous ([expr {int(round($r))}]:1)"
    }
    return "asynchronous"
}

set clk_a [make_clock CLK_A 2.0]
set clk_b [make_clock CLK_B 4.0]
set clk_c [make_clock CLK_C 3.0]

puts [clock_to_sdc $clk_a]
puts "\nA vs B: [clock_relationship $clk_a $clk_b]"
puts "A vs C: [clock_relationship $clk_a $clk_c]"
