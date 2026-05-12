# ============================================================
# 05_oo_method_introspection.tcl — Examining objects at runtime
# ============================================================

oo::class create Vehicle {
    variable make model year

    constructor {mk mo yr} {
        set make $mk; set model $mo; set year $yr
    }

    method info {} { return "$year $make $model" }
    method age  {} { expr {2024 - $year} }
}

# Car inherits from Vehicle and adds its own variable and method
oo::class create Car {
    superclass Vehicle
    variable doors

    constructor {mk mo yr d} {
        next $mk $mo $yr   ;# call Vehicle constructor
        set doors $d
    }

    method doors {} { return $doors }
}

set car [Car new "Toyota" "Camry" 2020 4]

# "info object class" returns the direct class of an object
puts "Class:      [info object class $car]"

# "info object isa typeof obj cls" returns 1 if obj is an instance of cls
# Works for the direct class AND any superclass (inheritance-aware)
puts "Is Vehicle: [info object isa typeof $car Vehicle]"

# "info object methods" lists all methods callable on this object
puts "Methods:    [lsort [info object methods $car]]"

# "info object vars" lists all instance variable names
puts "Vars:       [info object vars $car]"

puts "Info:       [$car info]"
puts "Age:        [$car age] years"

$car destroy
