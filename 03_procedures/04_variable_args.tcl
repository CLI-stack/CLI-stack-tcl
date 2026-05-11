proc sum {args} {
    set total 0
    foreach n $args { incr total $n }
    return $total
}
puts [sum 1 2 3]
puts [sum 10 20 30 40 50]
puts [sum]

proc log {level args} {
    puts "\[$level\] [join $args { }]"
}
log "INFO" "Server" "started" "on" "port" "8080"
log "ERROR" "Connection" "failed"

proc count_args {args} {
    puts "Got [llength $args] args: $args"
}
count_args a b c d
