# ============================================================
# 01_oo_class_basic.tcl — Object-Oriented Programming with TclOO (TCL 8.6+)
# ============================================================

# "oo::class create Name { body }" defines a new class
oo::class create Animal {
    # "variable" declares instance variables (each object gets its own copy)
    variable name species

    # "constructor" runs when a new object is created with "new" or "create"
    constructor {n s} {
        set name $n        ;# initialize instance variable
        set species $s
    }

    # "method" defines a behaviour that can be called on an instance
    method speak   {} { puts "$name says: ..." }
    method describe {} { puts "$name is a $species" }

    # A getter method — returns the value of an instance variable
    method get_name {} { return $name }
}

# "ClassName new arg..." creates a new instance and returns an object handle
set a [Animal new "Buddy" "Dog"]

# Call methods on the object using the handle as a command
$a describe
$a speak
puts "Name: [$a get_name]"

# "destroy" releases the object and frees its memory
$a destroy
