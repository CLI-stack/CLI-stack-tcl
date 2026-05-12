# ============================================================
# 01_namespace_basic.tcl — Organizing code with namespaces
# ============================================================

# "namespace eval name { body }" creates a namespace
# All procs and variables defined inside are scoped to that namespace
# Prevents name collisions between different modules
namespace eval MathLib {
    # "variable" declares a namespace-level variable
    variable pi 3.14159265358979

    proc circle_area {r} {
        variable pi    ;# must declare to access the namespace variable
        return [expr {$pi * $r * $r}]
    }

    proc circle_perim {r} {
        variable pi
        return [expr {2 * $pi * $r}]
    }
}

# Call a namespace proc using :: as the separator
puts "Area(5):  [MathLib::circle_area  5]"
puts "Perim(5): [MathLib::circle_perim 5]"

# Access a namespace variable using :: notation
puts "Pi:       $MathLib::pi"

# Introspect namespace contents
puts "\nProcs: [info procs MathLib::*]"
puts "Vars:  [info vars  MathLib::*]"
