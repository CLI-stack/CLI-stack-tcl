# ============================================================
# 04_variable_args.tcl — Variable number of arguments with args
# ============================================================

# The special argument name "args" captures all remaining arguments as a list
proc sum {args} {
    set total 0
    foreach n $args { incr total $n }   ;# iterate over all passed values
    return $total
}
puts [sum 1 2 3]            ;# args = {1 2 3}
puts [sum 10 20 30 40 50]   ;# args = {10 20 30 40 50}
puts [sum]                  ;# args = {} → returns 0

# Mix fixed and variadic — "level" is required, "args" gets the rest
proc log {level args} {
    # [join] concatenates list elements with a separator string
    puts "\[$level\] [join $args { }]"
}
log "INFO" "Server" "started" "on" "port" "8080"
log "ERROR" "Connection" "failed"

# Count how many args were passed
proc count_args {args} {
    # [llength] returns the number of elements in a list
    puts "Got [llength $args] args: $args"
}
count_args a b c d
