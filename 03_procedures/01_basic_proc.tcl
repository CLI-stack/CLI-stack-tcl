# ============================================================
# 01_basic_proc.tcl — Defining and calling procedures
# ============================================================

# "proc" defines a procedure: proc name {args} {body}
# Procedures are the primary way to reuse code in TCL

# A proc that takes one argument and produces output
proc greet {name} {
    puts "Hello, $name!"
}

# A proc that takes two arguments and returns a value
# "return" sends a value back to the caller
proc add {a b} {
    return [expr {$a + $b}]
}

# A proc with no arguments — empty braces {} for arg list
proc show_time {} {
    # [clock seconds] = Unix timestamp; [clock format] = human readable
    puts "Current time: [clock format [clock seconds]]"
}

# Calling the procedures
greet "World"
greet "Azman"
puts "3 + 4 = [add 3 4]"   ;# return value used in command substitution
show_time
