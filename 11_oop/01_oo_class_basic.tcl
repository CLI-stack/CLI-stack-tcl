oo::class create Animal {
    variable name species

    constructor {n s} {
        set name $n
        set species $s
    }

    method speak   {} { puts "$name says: ..." }
    method describe {} { puts "$name is a $species" }
    method get_name {} { return $name }
}

set a [Animal new "Buddy" "Dog"]
$a describe
$a speak
puts "Name: [$a get_name]"
$a destroy
