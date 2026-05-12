# ============================================================
# 01_if_else.tcl — Conditional branching
# ============================================================

set x 15

# Basic if/elseif/else — condition must be in { } or quotes
# The body block { } must start on the same line as "if" or "elseif"
if {$x > 20} {
    puts "greater than 20"
} elseif {$x > 10} {
    puts "greater than 10"    ;# this branch runs since 15 > 10
} elseif {$x > 5} {
    puts "greater than 5"
} else {
    puts "5 or less"
}

# Compound conditions using && (AND) and || (OR)
set a 5
set b 10

# && = logical AND — both must be true
if {$a > 0 && $b > 0} { puts "both positive" }

# || = logical OR — at least one must be true
if {$a > 10 || $b > 5} { puts "at least one condition met" }

# ! = logical NOT — inverts the boolean result
if {!($a == $b)} { puts "a and b differ" }
