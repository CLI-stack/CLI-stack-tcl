# ============================================================
# 04_eco_script.tcl — Generate ECO (Engineering Change Order) commands
# ============================================================

# Generate buffer-insertion ECO commands to fix hold timing violations
proc generate_eco {violations {fix_type hold}} {
    set cmds {}
    set n 0   ;# counter for unique buffer names

    foreach path $violations {
        set slack [dict get $path slack]
        set ep    [dict get $path endpoint]
        set sp    [dict get $path startpoint]

        # Only generate fixes for actual violations (negative slack)
        if {$fix_type eq "hold" && $slack < 0} {
            set buf "ECO_BUF_[incr n]"   ;# unique buffer name per violation

            # add_cell creates a new standard cell instance in the netlist
            lappend cmds "# Hold fix: $sp -> $ep  (slack=$slack)"
            lappend cmds "set_cell \[add_cell -reference BUFX2 $buf\]"

            # insert_cell_on_path places the buffer on the timing path
            lappend cmds "insert_cell_on_path -from $sp -to $ep $buf"
            lappend cmds ""
        }
    }

    lappend cmds "# Total buffers inserted: $n"
    return [join $cmds "\n"]
}

# Three paths: two are hold violations, one is passing (no fix needed)
set violations [list \
    [dict create startpoint reg_a endpoint reg_b slack -0.05] \
    [dict create startpoint reg_c endpoint reg_d slack -0.12] \
    [dict create startpoint reg_e endpoint reg_f slack  0.10] \
]

puts [generate_eco $violations hold]
