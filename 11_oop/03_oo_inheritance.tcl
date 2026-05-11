oo::class create Shape {
    variable color

    constructor {c} { set color $c }

    method color   {} { return $color }
    method area    {} { return 0 }
    method describe {} {
        puts "[info object class [self]] color=$color area=[my area]"
    }
}

oo::class create Circle {
    superclass Shape
    variable radius

    constructor {r {c "red"}} {
        next $c
        set radius $r
    }

    method area   {} { expr {3.14159 * $radius * $radius} }
    method radius {} { return $radius }
}

oo::class create Rectangle {
    superclass Shape
    variable w h

    constructor {width height {c "blue"}} {
        next $c
        set w $width; set h $height
    }

    method area {} { expr {$w * $h} }
}

set c [Circle new 5 "green"]
set r [Rectangle new 4 6]
$c describe
$r describe
$c destroy; $r destroy
