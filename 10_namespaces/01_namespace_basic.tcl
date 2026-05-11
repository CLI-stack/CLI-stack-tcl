namespace eval MathLib {
    variable pi 3.14159265358979

    proc circle_area {r} {
        variable pi
        return [expr {$pi * $r * $r}]
    }

    proc circle_perim {r} {
        variable pi
        return [expr {2 * $pi * $r}]
    }
}

puts "Area(5):  [MathLib::circle_area  5]"
puts "Perim(5): [MathLib::circle_perim 5]"
puts "Pi:       $MathLib::pi"

puts "\nProcs: [info procs MathLib::*]"
puts "Vars:  [info vars  MathLib::*]"
