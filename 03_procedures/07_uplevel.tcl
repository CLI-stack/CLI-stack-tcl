# ============================================================
# 07_uplevel.tcl — Executing code in a caller's scope
# ============================================================

# "uplevel 1 script" runs the script as if it were typed in the caller's scope
# Unlike upvar (which links one variable), uplevel runs arbitrary code there
proc run_in_caller {script} {
    uplevel 1 $script    ;# 1 = one level up (caller's scope)
}
set x 0
run_in_caller { set x 42 }   ;# this "set x 42" runs in the global scope
puts "x = $x"   ;# x was set to 42 in the global scope → 42

# Use uplevel to build custom control structures
# "repeat n body" runs body n times — body runs in the caller's scope
proc repeat {n body} {
    for {set i 0} {$i < $n} {incr i} {
        uplevel 1 $body    ;# body code sees the caller's variables
    }
}
set count 0
repeat 3 { incr count; puts "count=$count" }

# Measure execution time of any block of code
proc time_it {label script} {
    set t0 [clock milliseconds]
    uplevel 1 $script           ;# run the provided code in caller's scope
    puts "$label: [expr {[clock milliseconds]-$t0}]ms"
}
time_it "loop" {
    set s 0
    for {set i 0} {$i < 100000} {incr i} { incr s $i }
}
