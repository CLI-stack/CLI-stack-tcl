oo::class create Printable {
    method print {} {
        puts "--- [info object class [self]] ---"
        foreach var [info object vars [self]] {
            puts "  $var = [set [my varname $var]]"
        }
    }
}

oo::class create Serializable {
    method serialize {} {
        set d [dict create]
        foreach var [info object vars [self]] {
            dict set d $var [set [my varname $var]]
        }
        return $d
    }
}

oo::class create Person {
    mixin Printable Serializable
    variable name age email

    constructor {n a e} {
        set name $n; set age $a; set email $e
    }
}

set p [Person new "Alice" 30 "alice@example.com"]
$p print
puts "Serialized: [$p serialize]"
$p destroy
