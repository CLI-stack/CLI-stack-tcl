proc generate_eco {violations {fix_type hold}} {
    set cmds {}
    set n 0

    foreach path $violations {
        set slack [dict get $path slack]
        set ep    [dict get $path endpoint]
        set sp    [dict get $path startpoint]

        if {$fix_type eq "hold" && $slack < 0} {
            set buf "ECO_BUF_[incr n]"
            lappend cmds "# Hold fix: $sp -> $ep  (slack=$slack)"
            lappend cmds "set_cell \[add_cell -reference BUFX2 $buf\]"
            lappend cmds "insert_cell_on_path -from $sp -to $ep $buf"
            lappend cmds ""
        }
    }

    lappend cmds "# Total buffers inserted: $n"
    return [join $cmds "\n"]
}

set violations [list \
    [dict create startpoint reg_a endpoint reg_b slack -0.05] \
    [dict create startpoint reg_c endpoint reg_d slack -0.12] \
    [dict create startpoint reg_e endpoint reg_f slack  0.10] \
]

puts [generate_eco $violations hold]
