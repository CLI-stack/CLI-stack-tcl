oo::class create Vehicle {
    variable make model year

    constructor {mk mo yr} {
        set make $mk; set model $mo; set year $yr
    }

    method info {} { return "$year $make $model" }
    method age  {} { expr {2024 - $year} }
}

oo::class create Car {
    superclass Vehicle
    variable doors

    constructor {mk mo yr d} {
        next $mk $mo $yr
        set doors $d
    }

    method doors {} { return $doors }
}

set car [Car new "Toyota" "Camry" 2020 4]

puts "Class:      [info object class $car]"
puts "Is Vehicle: [info object isa typeof $car Vehicle]"
puts "Methods:    [lsort [info object methods $car]]"
puts "Vars:       [info object vars $car]"
puts "Info:       [$car info]"
puts "Age:        [$car age] years"

$car destroy
