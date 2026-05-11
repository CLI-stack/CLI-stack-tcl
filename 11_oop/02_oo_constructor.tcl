oo::class create Counter {
    variable count step label

    constructor {{init 0} {s 1} {lbl "Counter"}} {
        set count $init
        set step  $s
        set label $lbl
    }

    destructor { puts "Counter '$label' destroyed at $count" }

    method increment {} { incr count  $step }
    method decrement {} { incr count [expr {-$step}] }
    method reset     {} { set  count  0 }
    method value     {} { return $count }
    method show      {} { puts "$label: $count" }
}

set c1 [Counter new]
set c2 [Counter new 100 5 "MyCounter"]

$c1 increment; $c1 increment; $c1 show
$c2 increment; $c2 increment; $c2 show

$c1 destroy
$c2 destroy
