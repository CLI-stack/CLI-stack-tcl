# ============================================================
# 05_namespace_ensemble.tcl — Ensemble commands (object-like dispatch)
# ============================================================

namespace eval Stack {
    variable items {}   ;# shared stack storage

    # Each proc implements one "subcommand" of the ensemble
    proc push {item} {
        variable items
        lappend items $item   ;# append to end = push
    }

    proc pop {} {
        variable items
        if {[llength $items] == 0} { error "Stack underflow" }
        set top [lindex $items end]              ;# peek at top
        set items [lrange $items 0 end-1]        ;# remove top element
        return $top
    }

    proc peek {} { variable items; lindex $items end }    ;# top without removal
    proc size {} { variable items; llength $items }       ;# number of elements

    # "namespace export" is required so the ensemble can find the subcommands
    namespace export push pop peek size

    # "namespace ensemble create" turns the namespace into a dispatch command
    # After this, "Stack push x" dispatches to Stack::push
    namespace ensemble create
}

# Now "Stack" works like a command with subcommands
Stack push "first"
Stack push "second"
Stack push "third"
puts "Size: [Stack size]"
puts "Peek: [Stack peek]"
puts "Pop:  [Stack pop]"
puts "Pop:  [Stack pop]"
puts "Size: [Stack size]"
