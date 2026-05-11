proc greet {name} {
    puts "Hello, $name!"
}

proc add {a b} {
    return [expr {$a + $b}]
}

proc show_time {} {
    puts "Current time: [clock format [clock seconds]]"
}

greet "World"
greet "Azman"
puts "3 + 4 = [add 3 4]"
show_time
