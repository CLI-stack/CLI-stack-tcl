proc parse_netlist {filename} {
    set cells [dict create]

    if {![file exists $filename]} {
        set fh [open $filename w]
        puts $fh "cell AND2 U1 (.A(net1), .B(net2), .Z(net3))"
        puts $fh "cell OR2  U2 (.A(net3), .B(net4), .Z(net5))"
        puts $fh "cell INV  U3 (.A(net5), .Z(net6))"
        close $fh
    }

    set fh [open $filename r]
    while {[gets $fh line] >= 0} {
        set line [string trim $line]
        if {[regexp {^cell\s+(\w+)\s+(\w+)} $line -> type inst]} {
            dict set cells $inst type $type
            set pins [regexp -all -inline {\.\w+\(\w+\)} $line]
            dict set cells $inst pins $pins
        }
    }
    close $fh
    return $cells
}

set f "/tmp/sample.net"
set cells [parse_netlist $f]
puts "Parsed [dict size $cells] cells:"
dict for {inst info} $cells {
    puts "  $inst: [dict get $info type]  pins=[dict get $info pins]"
}
file delete -force $f
