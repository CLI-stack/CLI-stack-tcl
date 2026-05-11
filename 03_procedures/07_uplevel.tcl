proc run_in_caller {script} {
    uplevel 1 $script
}
set x 0
run_in_caller { set x 42 }
puts "x = $x"   ;# 42

# Custom control structure
proc repeat {n body} {
    for {set i 0} {$i < $n} {incr i} {
        uplevel 1 $body
    }
}
set count 0
repeat 3 { incr count; puts "count=$count" }

proc time_it {label script} {
    set t0 [clock milliseconds]
    uplevel 1 $script
    puts "$label: [expr {[clock milliseconds]-$t0}]ms"
}
time_it "loop" {
    set s 0
    for {set i 0} {$i < 100000} {incr i} { incr s $i }
}
