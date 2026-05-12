# ============================================================
# 07_clock_constraints.tcl — Clock definition and relationship analysis
# ============================================================

# Create a clock specification dict with derived properties
proc make_clock {name period {unc 0.05} {trans 0.02}} {
    return [dict create \
        name        $name \
        period      $period \
        frequency   [expr {1000.0 / $period}] \
        uncertainty $unc \
        transition  $trans \
    ]
}

# Convert a clock spec dict to SDC commands
proc clock_to_sdc {spec} {
    dict with spec {
        set lines {}
        # create_clock: defines the clock waveform
        lappend lines "create_clock -period $period -name $name \[get_ports ${name}_clk\]"
        # set_clock_uncertainty: accounts for jitter and skew
        lappend lines "set_clock_uncertainty $uncertainty \[get_clocks $name\]"
        # set_clock_transition: specifies the rise/fall slew rate
        lappend lines "set_clock_transition  $transition  \[get_clocks $name\]"
        return [join $lines "\n"]
    }
}

# Determine if two clocks are synchronous (integer ratio) or asynchronous
proc clock_relationship {ck1 ck2} {
    set r [expr {[dict get $ck2 period] / [dict get $ck1 period]}]
    if {abs($r - round($r)) < 0.001} {
        return "synchronous ([expr {int(round($r))}]:1)"
    }
    return "asynchronous"
}

set clk_a [make_clock CLK_A 2.0]   ;# 500 MHz
set clk_b [make_clock CLK_B 4.0]   ;# 250 MHz — exactly 2:1 ratio with clk_a
set clk_c [make_clock CLK_C 3.0]   ;# 333 MHz — not integer ratio

puts [clock_to_sdc $clk_a]
puts "\nA vs B: [clock_relationship $clk_a $clk_b]"   ;# synchronous
puts "A vs C: [clock_relationship $clk_a $clk_c]"   ;# asynchronous
