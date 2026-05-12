# ============================================================
# 02_oo_constructor.tcl — Constructors, destructors, and methods
# ============================================================

oo::class create Counter {
    variable count step label

    # Constructor with optional arguments (using TCL default-arg syntax)
    # {init 0} means "init" defaults to 0 if not provided
    constructor {{init 0} {s 1} {lbl "Counter"}} {
        set count $init
        set step  $s
        set label $lbl
    }

    # "destructor" runs automatically when the object is destroyed
    # Useful for cleanup (close files, log, release resources)
    destructor { puts "Counter '$label' destroyed at $count" }

    method increment {} { incr count  $step }
    method decrement {} { incr count [expr {-$step}] }
    method reset     {} { set  count  0 }
    method value     {} { return $count }
    method show      {} { puts "$label: $count" }
}

set c1 [Counter new]              ;# uses all defaults: init=0 step=1 label=Counter
set c2 [Counter new 100 5 "MyCounter"]   ;# custom initial value, step, and label

$c1 increment; $c1 increment; $c1 show   ;# Counter: 2
$c2 increment; $c2 increment; $c2 show   ;# MyCounter: 110

$c1 destroy   ;# triggers destructor
$c2 destroy
