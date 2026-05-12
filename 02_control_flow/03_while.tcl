# ============================================================
# 03_while.tcl — while loop
# ============================================================

# while keeps executing the body as long as the condition is true
set i 0
while {$i < 5} {
    puts "i = $i"
    incr i           ;# "incr" increments a variable by 1 (default)
}

# Infinite loop with "break" to exit
# "while {1}" is the TCL idiom for an infinite loop
set count 0
while {1} {
    incr count
    if {$count >= 3} break   ;# break exits the innermost loop immediately
}
puts "Broke at count: $count"

# do-while equivalent: body runs at least once
# TCL has no built-in do-while, so we use while {1} with break at end
set n 1
while {1} {
    puts "n = $n"
    incr n
    if {$n > 3} break    ;# check condition at end = do-while behaviour
}
