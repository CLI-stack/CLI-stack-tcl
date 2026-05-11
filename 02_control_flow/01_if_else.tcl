set x 15

if {$x > 20} {
    puts "greater than 20"
} elseif {$x > 10} {
    puts "greater than 10"
} elseif {$x > 5} {
    puts "greater than 5"
} else {
    puts "5 or less"
}

# Compound conditions
set a 5
set b 10
if {$a > 0 && $b > 0} { puts "both positive" }
if {$a > 10 || $b > 5} { puts "at least one condition met" }
if {!($a == $b)}        { puts "a and b differ" }
