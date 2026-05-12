# ============================================================
# 04_oo_mixin.tcl — Adding behaviour with mixins
# ============================================================

# A mixin is a class that adds methods without being a full parent class
# Use mixins to share behaviour across unrelated classes

# Printable mixin: adds a "print" method to any class
oo::class create Printable {
    method print {} {
        puts "--- [info object class [self]] ---"
        # [info object vars] returns all instance variable names
        foreach var [info object vars [self]] {
            # [my varname v] maps instance var name to its internal storage name
            puts "  $var = [set [my varname $var]]"
        }
    }
}

# Serializable mixin: adds a "serialize" method that returns a dict
oo::class create Serializable {
    method serialize {} {
        set d [dict create]
        foreach var [info object vars [self]] {
            dict set d $var [set [my varname $var]]
        }
        return $d
    }
}

# Use "mixin" to add both mixins to the Person class
oo::class create Person {
    mixin Printable Serializable   ;# Person gets print + serialize for free
    variable name age email

    constructor {n a e} {
        set name $n; set age $a; set email $e
    }
}

set p [Person new "Alice" 30 "alice@example.com"]
$p print
puts "Serialized: [$p serialize]"
$p destroy
