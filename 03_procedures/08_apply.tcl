# ============================================================
# 08_apply.tcl — Anonymous functions with apply
# ============================================================

# "apply" executes a lambda (anonymous function) without giving it a name
# A lambda is a two-element list: {arglist body}

# Define a lambda as a variable — {x} is the arg list, the rest is the body
set square [list {x} { expr {$x * $x} }]
puts [apply $square 5]    ;# call the lambda with argument 5
puts [apply $square 12]

# Lambda with two arguments
set add [list {a b} { expr {$a + $b} }]
puts [apply $add 3 7]

# lmap (TCL 8.6+) applies a transformation to every list element
# It's equivalent to map() in Python/Haskell
set nums {1 2 3 4 5}
set doubled [lmap n $nums { expr {$n * 2} }]   ;# body is a mini-lambda
puts "Doubled: $doubled"

# Lambda stored as a variable and reused
set greet {{name} { return "Hello, $name!" }}
puts [apply $greet "World"]
puts [apply $greet "Azman"]
