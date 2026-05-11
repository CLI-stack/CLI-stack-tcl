proc generate_sdc {clocks input_ports} {
    set lines {}
    lappend lines "# Auto-generated SDC"
    lappend lines "# [clock format [clock seconds] -format {%Y-%m-%d %H:%M:%S}]"
    lappend lines ""

    lappend lines "# Clock Definitions"
    dict for {name info} $clocks {
        set period [dict get $info period]
        set port   [dict get $info port]
        lappend lines "create_clock -name $name -period $period \[get_ports $port\]"
        lappend lines "set_clock_uncertainty 0.1 \[get_clocks $name\]"
        lappend lines "set_clock_transition  0.05 \[get_clocks $name\]"
        lappend lines ""
    }

    lappend lines "# I/O Constraints"
    foreach port $input_ports {
        lappend lines "set_input_delay -max 0.5 -clock CLK \[get_ports $port\]"
    }

    return [join $lines "\n"]
}

set clocks [dict create \
    CLK  [dict create period 2.0 port clk]  \
    CLK2 [dict create period 4.0 port clk2] \
]

puts [generate_sdc $clocks {in_a in_b in_c}]
