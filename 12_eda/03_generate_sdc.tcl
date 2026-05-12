# ============================================================
# 03_generate_sdc.tcl — Generate Synopsys Design Constraints (SDC)
# ============================================================

# Generate an SDC constraint file from clock and port specifications
proc generate_sdc {clocks input_ports} {
    set lines {}

    # Header with generation timestamp
    lappend lines "# Auto-generated SDC"
    lappend lines "# [clock format [clock seconds] -format {%Y-%m-%d %H:%M:%S}]"
    lappend lines ""

    # Clock definitions — one create_clock and associated attributes per clock
    lappend lines "# Clock Definitions"
    dict for {name info} $clocks {
        set period [dict get $info period]
        set port   [dict get $info port]

        # create_clock defines a clock signal with its period and source port
        lappend lines "create_clock -name $name -period $period \[get_ports $port\]"

        # set_clock_uncertainty models clock jitter/skew
        lappend lines "set_clock_uncertainty 0.1 \[get_clocks $name\]"

        # set_clock_transition models the clock edge slew rate
        lappend lines "set_clock_transition  0.05 \[get_clocks $name\]"
        lappend lines ""
    }

    # Input delay constraints — how late data can arrive relative to the clock
    lappend lines "# I/O Constraints"
    foreach port $input_ports {
        lappend lines "set_input_delay -max 0.5 -clock CLK \[get_ports $port\]"
    }

    return [join $lines "\n"]   ;# join all lines into a single string
}

set clocks [dict create \
    CLK  [dict create period 2.0 port clk]  \
    CLK2 [dict create period 4.0 port clk2] \
]

puts [generate_sdc $clocks {in_a in_b in_c}]
