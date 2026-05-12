# ============================================================
# 03_oo_inheritance.tcl — Inheriting from a parent class
# ============================================================

# Base class — every shape has a color and an area
oo::class create Shape {
    variable color

    constructor {c} { set color $c }

    method color   {} { return $color }
    method area    {} { return 0 }   ;# default — override in subclasses

    method describe {} {
        # [info object class [self]] returns the class name of this object
        # [self] returns the current object's handle
        puts "[info object class [self]] color=$color area=[my area]"
    }
}

# Subclass using "superclass" — inherits all Shape methods
oo::class create Circle {
    superclass Shape
    variable radius

    constructor {r {c "red"}} {
        next $c     ;# "next" calls the parent (Shape) constructor
        set radius $r
    }

    method area   {} { expr {3.14159 * $radius * $radius} }   ;# override
    method radius {} { return $radius }
}

oo::class create Rectangle {
    superclass Shape
    variable w h

    constructor {width height {c "blue"}} {
        next $c
        set w $width; set h $height
    }

    method area {} { expr {$w * $h} }   ;# override base class method
}

set c [Circle new 5 "green"]
set r [Rectangle new 4 6]
$c describe   ;# Circle color=green area=78.53...
$r describe   ;# Rectangle color=blue area=24
$c destroy; $r destroy
